ARG DISTRO_NAME=bullseye
ARG PG_MAJOR=14
ARG YARN_VERSION

FROM ruby:3.3.0-slim-$DISTRO_NAME as web-base

ARG DISTRO_NAME

# Common dependencies
RUN apt-get update -qq \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    curl \
    less \
    libsodium-dev \
    libidn11-dev \
    git \
    shared-mime-info\
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log

# Install PostgreSQL dependencies
RUN curl -sSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
    gpg --dearmor -o /usr/share/keyrings/postgres-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/postgres-archive-keyring.gpg] https://apt.postgresql.org/pub/repos/apt/" \
    $DISTRO_NAME-pgdg main $PG_MAJOR | tee /etc/apt/sources.list.d/postgres.list > /dev/null
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
  --mount=type=cache,target=/var/lib/apt,sharing=locked \
  --mount=type=tmpfs,target=/var/log \
  apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade && \
  DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    libpq-dev \
    postgresql-client-$PG_MAJOR

# The production-builder image is responsible for installing dependencies and compiling assets
FROM web-base as production-builder 

# Install NodeJS and Yarn
ARG NODE_MAJOR=16

RUN curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR.x | bash -
RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    nodejs \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log

RUN npm install -g yarn@$YARN_VERSION

# First, we create and configure a dedicated user to run our application
RUN groupadd --gid 1005 my_user \
  && useradd --uid 1005 --gid my_user --shell /bin/bash --create-home my_user

USER my_user

RUN mkdir /home/my_user/app

WORKDIR /home/my_user/app

ENV BUNDLER_VERSION='2.3.26'
RUN gem install bundler --no-document -v '2.3.26'

# Config bundler
ENV RAILS_ENV=production \
  LANG=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3 \
  BUNDLE_APP_CONFIG=/home/my_user/bundle \
  PATH="/home/my_user/app/bin:${PATH}" \
  BUNDLE_PATH=/home/my_user/bundle \
  GEM_HOME=/home/my_user/bundle

# Install Ruby gems
COPY --chown=my_user:my_user Gemfile Gemfile.lock ./

RUN mkdir $BUNDLE_PATH \
  && bundle config set deployment 'true' \
  && bundle config set path "${BUNDLE_PATH}" \
  && bundle config set without 'development test' \
  && bundle config --local clean 'true' \
  && bundle install --jobs=${BUNDLE_JOBS} \
  && rm -rf $BUNDLE_PATH/ruby/3.1.3/cache/* \
  && rm -rf /home/my_user/.bundle/cache/*

# Install JS packages
COPY --chown=my_user:my_user package.json yarn.lock ./
RUN yarn install --check-files

# Copy code, see .dockerignore for excluded files
COPY --chown=my_user:my_user . .

# This should be fixed
RUN RAILS_ENV=production SECRET_KEY_BASE=assets bundle exec rails assets:precompile

FROM ruby:3.1.3-slim-$DISTRO_NAME as production

# Production-only dependencies
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
  --mount=type=cache,target=/var/lib/apt,sharing=locked \
  --mount=type=tmpfs,target=/var/log \
  apt-get update -qq \
  && apt-get dist-upgrade -y \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    curl \
    gnupg2 \
    less \
    tzdata \
    time \
    locales \
    shared-mime-info \
    libpq-dev \
  && update-locale LANG=C.UTF-8 LC_ALL=C.UTF-8

# Install NodeJS and Yarn
ARG NODE_MAJOR=16

RUN curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR.x | bash -
RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    nodejs \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log

# Upgrade RubyGems and install the latest Bundler version
ENV BUNDLER_VERSION='2.3.26'
RUN gem install bundler --no-document -v '2.3.26'

# Create and configure a dedicated user (use the same name as for the production-builder image)
RUN groupadd --gid 1005 my_user \
  && useradd --uid 1005 --gid my_user --shell /bin/bash --create-home my_user
  
RUN mkdir /home/my_user/app
WORKDIR /home/my_user/app
USER my_user

# Ruby/Rails env configuration
ENV RAILS_ENV=production \
  BUNDLE_APP_CONFIG=/home/my_user/bundle \
  BUNDLE_PATH=/home/my_user/bundle \
  GEM_HOME=/home/my_user/bundle \
  PATH="/home/my_user/app/bin:${PATH}" \
  LANG=C.UTF-8 \
  LC_ALL=C.UTF-8

EXPOSE 3000

# Copy code
COPY --chown=my_user:my_user . .

# Copy artifacts
# 1) Installed gems
COPY --from=production-builder $BUNDLE_PATH $BUNDLE_PATH
# 2) Compiled assets (by Webpacker in this case)
COPY --from=production-builder /home/my_user/app/public/packs /home/my_user/app/public/packs
# 3) We can even copy the Bootsnap cache to speed up our Rails server load!
# COPY --chown=my_user:my_user --from=production-builder /home/my_user/app/tmp/cache/bootsnap* /home/my_user/app/tmp/cache/

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]

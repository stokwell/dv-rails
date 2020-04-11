FROM ruby:2.6.1

MAINTAINER Vitaly Lyapunov <vitaly.lyapnunov@gmail.com>

RUN apt-get update && apt-get install -my wget gnupg && apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential libpq-dev libxml2-dev curl

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -\
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y yarn

RUN apt-get update && apt-get install -y postgresql-client

RUN echo "alias rails='bundle exec'" >> ~/.bash_profile

ENV INSTALL_PATH /dv-rails

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile.lock ./
COPY Gemfile Gemfile
RUN gem update --system
RUN gem install bundler
RUN bundle install

RUN yarn install

VOLUME ["$INSTALL_PATH/public"]

COPY . .

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]

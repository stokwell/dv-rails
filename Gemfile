source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.3.0'

gem 'rails', '7.0.4'

gem 'bootsnap', '~> 1.7.4', require: false
gem 'mimemagic', '~> 0.3.10'
gem 'rack-cors'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'tzinfo-data'
gem 'redis', '~> 4.0'
gem 'sidekiq'

#Use devise for authorization
gem 'devise'
gem "omniauth"
gem 'omniauth-google-oauth2'
gem 'omniauth-rails_csrf_protection'
gem 'omniauth-facebook', '~> 4.0'
gem 'font-awesome-sass', '~> 4.4.0'

gem 'dotenv-rails', groups: [:development, :test]

gem 'haml-rails'
gem 'bootstrap', '~> 4.4.1'
gem 'jquery-rails'
gem 'webpacker'
gem 'sprockets', '~> 3.7.2'
gem 'sass-rails', '>= 6'
gem 'jbuilder'

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  gem 'spring'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

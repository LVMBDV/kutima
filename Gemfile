# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'auth0'
gem 'bootsnap', require: false
gem 'hotwire-rails'
gem 'jbuilder'
gem 'newrelic_rpm'
gem 'omniauth-auth0'
gem 'omniauth-rails_csrf_protection'
gem 'pg'
gem 'puma'
gem 'rails'
gem 'redis'
gem 'sass-rails'
gem 'sidekiq'
gem 'view_component', require: 'view_component/engine'
gem 'webpacker'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-byebug'
  gem 'rspec-rails'
end

group :development do
  gem 'brakeman'
  gem 'guard'
  gem 'guard-rspec'
  gem 'listen'
  gem 'overcommit'
  gem 'pry-rails'
  gem 'rack-mini-profiler'
  gem 'reek'
  gem 'rubocop'
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'spring'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'webmock'
end

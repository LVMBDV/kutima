# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'bootsnap', require: false
gem 'hotwire-rails'
gem 'jbuilder'
gem 'pg'
gem 'puma'
gem 'rails'
gem 'redis'
gem 'sass-rails'
gem 'sidekiq'
gem 'webpacker'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-byebug'
  gem 'rspec-rails'
end

group :development do
  gem 'listen'
  gem 'pry-rails'
  gem 'rack-mini-profiler'
  gem 'reek'
  gem 'rubocop'
  gem 'spring'
  gem 'web-console'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end

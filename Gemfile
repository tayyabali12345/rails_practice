# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.8', '>= 5.2.8.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'bootstrap', '~> 5.2.2'
gem 'devise'
gem 'mini_magick'
gem 'pundit'
gem 'ransack'
gem 'simple_form'
gem 'uglifier', '>= 1.3.0'
# gem "thinking-sphinx"
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'faker'
  gem 'rails-controller-testing'
  #gem 'active_storage_validations', '~> 0.9.8'
end

group :test do
  gem 'simplecov'
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver', '~> 2.35.1'
  gem 'shoulda-matchers', '~> 5.0'
end

gem 'cloudinary'
gem 'active_storage_validations'
group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'select2-rails'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # gem 'jquery-rails'

  gem 'active_storage_validations'
  gem 'image_processing'
  gem 'jquery-rails', '~> 4.3', '>= 4.3.3'
  gem 'paypal-checkout-sdk'
  gem 'paypal-recurring'
  gem 'paypal-sdk-rest'
  gem 'rails-ujs', '~> 0.1.0'
  gem 'rmagick'

  group :development, :test do
    gem 'rubocop'
    gem 'rubocop-minitest'
    gem 'rubocop-performance'
    gem 'rubocop-rails'
    # or gem 'rubocop-rspec' depending on your test suite
  end

  gem 'rack-cors'
  gem 'active_model_serializers', '~> 0.10.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

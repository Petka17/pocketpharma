source 'https://rubygems.org'

ruby '2.0.0'
#ruby-gemset=railstutorial_rails_4_0

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use Postgres as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# Pagination
gem 'will_paginate', '~> 3.0'

# File uploader
gem "carrierwave"

# File jQuery Uploader
gem 'jquery-fileupload-rails'

# XLS import (for RLS file treat)
gem 'roo'

# HTML parsing
gem 'nokogiri'

# Workers
gem 'sidekiq'
gem 'sinatra', require: false

group :development do
	# Performance Profile
	gem 'rack-mini-profiler'

	# SQL optimization
	gem 'bullet'

	# Better Error
	gem 'better_errors'
	gem 'binding_of_caller'

	# Rails Panel
	gem 'meta_request'

	# Use debugger
	gem 'debugger'
end

group :production do
	# Web server
  gem 'unicorn'

  # Heroku gems
  gem 'rails_12factor'
  gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
end

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

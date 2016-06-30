source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0.rc2', '< 5.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Bootstrap is it compatible ?
gem 'bootstrap-sass', '~> 3.3.6'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.x'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Authentication
gem 'devise', '~> 4.1.1'
gem 'devise-i18n'

# Async Jobs
gem 'sidekiq', '~> 4.1.2'

# Form view helpers
gem 'formtastic', '~> 3.1.4'
# Dynamically add/remove has_many records
gem 'cocoon'

# Image processing
gem 'paperclip', '~> 5.0.0.beta2'

# AWS SDK :)
gem 'aws-sdk', '~> 2.3'

# Semantic UI
gem 'less-rails-semantic_ui'
gem 'autoprefixer-rails'
gem 'therubyracer'

# Font Awesome
gem 'font-awesome-rails'

group :staging do
  gem 'recipient_interceptor'
end

group :development, :test do
  # Testing framework
  gem 'rspec-rails', '= 3.5.0.beta4'
  # Automatic rspec -- BEGIN
  gem 'rspec-core', '= 3.5.0.beta4'
  gem 'rspec', '= 3.5.0.beta4'
  gem 'rspec-expectations', '= 3.5.0.beta4'
  gem 'rspec-mocks', '= 3.5.0.beta4'
  gem 'rspec-support', '= 3.5.0.beta4'

  gem 'guard-rspec', '~> 4.7', require: false
  # ------------------ END

  # Fixtures
  gem 'factory_girl_rails', '~> 4.7'
  # Env variables
  gem 'dotenv-rails'
end

group  :staging, :development, :test do
  # Fake data
  gem 'faker'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Opens email in browser
  gem 'letter_opener', '~> 1.4.1'
  # Generate graph for your DB
  gem 'rails-erd'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

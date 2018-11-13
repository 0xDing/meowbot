source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'dotenv-rails', '2.5.0'
gem 'active_type', '~> 0.7.5'
gem 'rails', '~> 5.2.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.12'
gem 'jbuilder', '~> 2.5'
gem 'httparty', '~> 0.16.2'

gem 'telegram-bot', '~> 0.14.1'
gem 'telegram-bot-types'
gem 'google-cloud-dialogflow', '~> 0.2.2'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'


# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  gem 'brakeman', '~> 4.3.1', require: false
  gem 'factory_bot_rails'
  gem 'ffaker'
  # rubymine rubocop integration
  gem 'rubocop', require: false
  gem 'rubocop-scc', '~> 0.2.1', require: false
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'awesome_print'
  gem 'ruby-prof'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'webmock'
end
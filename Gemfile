source 'https://rubygems.org'

ruby '2.0.0'

gem 'bootstrap-sass', '~> 3.0.0.0.rc'
gem 'devise', '~> 3.1'
gem 'high_voltage'
gem 'jquery-rails'
gem 'pg'
gem 'rails', '4.0.0'
gem 'sass-rails', '~> 4.0.0'
gem 'simple_form', '~> 3.0.0'
gem 'uglifier', '>= 1.3.0'

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end

group :development do
  gem 'brakeman'
  gem 'foreman'
  gem 'quiet_assets'
end

group :development, :test do
  gem 'debugger'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'ffaker'
end

group :test do
  gem 'database_cleaner'
  gem 'rspec-rails', '~> 2.14'
  gem 'shoulda-matchers'
end

source 'https://rubygems.org'
ruby "2.6.5"

gem "rails", "~> 4.0.0"
gem "high_voltage", "~> 1.2.3"
gem "thin", '~> 1.7', '>= 1.7.2'
gem "turbolinks", "~> 1.3.0"
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'
gem "simple_enum", "~> 1.6.5"

group :assets do
  gem "sass-rails", "~> 4.0.0"
  gem "coffee-rails", "~> 4.0.0"
  gem "uglifier", "~> 2.1.1"
  gem "jquery-rails", "~> 3.0.2"
  gem "zurb-foundation", "~> 4.2.3"
end

group :development do
  gem "better_errors", "~> 0.9.0"
  gem "pry-rails", "~> 0.3.1"
  gem "letter_opener", "~> 1.1.2"
  gem "quiet_assets", "~> 1.0.2"
  gem 'sqlite3', '~> 1.4', '>= 1.4.2'
  gem "binding_of_caller", "~> 0.7.2"
end

group :production do
  gem 'pg', '~> 1.1', '>= 1.1.4'
  gem 'rails_12factor'
end

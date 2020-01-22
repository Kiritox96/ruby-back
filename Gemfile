source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'
# Use Puma as the app server
gem 'puma', '~> 3.11'
gem 'responders'
gem 'mongoid'
gem 'active_rest_client'
gem 'rack-cors', :require => 'rack/cors'
gem 'simple_command'
#gem 'sentry-raven'
# Reduces boot times through caching; required in config/boot.rb
# Use Json Web Token (JWT) for token based authentication
gem 'jwt'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
 
end



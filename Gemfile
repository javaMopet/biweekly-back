source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.4'

# Use sqlserver as the database for Active Record
gem 'activerecord-sqlserver-adapter', '~> 7.0.4'
# Use postgresql as the database for Active Record
# gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Revisar
# gem 'matrix'
# Fast, Nimble PDF Generation For Ruby
gem 'prawn', '~> 2.5.0'
# end revisar

# Use graphql_devise for authentication
gem 'graphql_devise', '~> 1.4.0'

# Use rolify with cancan for authorization
gem "rolify", '~> 6.0.1'
# Use rolify with cancancan for authorization
gem 'cancancan', '~> 3.5.0'

# Generacion de archivos excel
gem 'caxlsx', '~> 4.1.0'
# gem 'caxlsx_rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"
# gem 'dalli'
# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data' # , platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', "~> 1.18.3", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem "rack-cors"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  # uso de la interfaz para graphql

  # sprockets-rails for graphql
  gem 'graphiql-rails', '~> 1.10.0'

  # Use propshaft for serving static assets
  gem 'propshaft', '~> 0.8.0'

  # rubocop gem
  gem 'rubocop', '~> 1.69', require: false
  # Use rubocop-rails for rails specific rules
  gem 'rubocop-rails', '~> 2.31.0', require: false
end
# Use sprockets for serving static assets
gem 'sprockets-rails', "3.4.2"
# Shim to load environment variables from .env into ENV in development.
gem 'dotenv', "~> 3.1.0", groups: [:development, :test]

# gem 'devise-jwt', '~> 0.10.0'
gem 'rack-cors', '~> 1.1'

# Blueprinter for json formatting
gem 'blueprinter', '~> 1.0.2'
# oj
gem 'oj', '~> 3.16.3'
gem "byebug", "~> 11.1", :groups => [:development, :test]

require_relative "boot"

require "rails/all"
require "sprockets/railtie"
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BiweeklyBack
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # This also configures session_options for use below
	  config.session_store :cookie_store, key: '_interslice_session'

	  # Required for all session managment (regardless of session_store)
	  config.middleware.use ActionDispatch::Cookies

	  config.middleware.use config.session_store, config.session_options

    # Configuration for the application, engines, and railties goes here.

    # config/application.rb
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    # Permitted locales available for the application
    I18n.available_locales = [:en, :es]

    # Set default locale to something other than :en
    # I18n.default_locale = :es
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.time_zone = "America/Mexico_City"
    config.active_record.default_timezone = :local

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
  end
end

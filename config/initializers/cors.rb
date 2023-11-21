# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'

    resource '*',
             headers: :any,
             methods: [:get, :post, :put, :patch, :delete, :options, :head],
             expose: %w[Authorization Uid]
  end
  # allow do
  #   # origins ENV.fetch('CORS_ORIGIN', '172.17.155.176:9000'), 'http://unishop-front.test'
  #   origins ENV.fetch('CORS_ORIGIN', 'localhost:9001'), 'http://biweekly-front.test'

  #   resource '*',
  #            headers: :any,
  #            methods: %i[get post put patch delete options head],
  #            expose: %w[Authorization Uid]
  # end
  # allow do
  #   # origins ENV.fetch('CORS_ORIGIN', '172.17.155.176:9000'), 'http://unishop-front.test'
  #   origins ENV.fetch('CORS_ORIGIN', '172.17.0.1:9001'), 'http://biweekly-front.test'

  #   resource '*',
  #            headers: :any,
  #            methods: %i[get post put patch delete options head],
  #            expose: %w[Authorization Uid]
  # end
  # allow do
  #   # origins ENV.fetch('CORS_ORIGIN', '172.17.155.176:9000'), 'http://unishop-front.test'
  #   origins ENV.fetch('CORS_ORIGIN', '192.168.100.12:9001'), 'http://biweekly-front.test'

  #   resource '*',
  #            headers: :any,
  #            methods: %i[get post put patch delete options head],
  #            expose: %w[Authorization Uid]
  # end
end

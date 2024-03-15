# frozen_string_literal: true

DeviseTokenAuth.setup do |config|
  
  config.change_headers_on_each_request = false
  
  config.token_cost = Rails.env.test? ? 4 : 10
  
  config.enable_standard_devise_support = false
  
  config.send_confirmation_email = true
  
end

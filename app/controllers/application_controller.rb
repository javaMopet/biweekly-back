# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::API
  # To enable sign in to function correctly.
  # skip_before_action :verify_authenticity_token, only: :create

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Restrict parameters for sign up input.
  def configure_permitted_parameters
    added_attrs = %i[email encrypted_password name]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
    devise_parameter_sanitizer.permit(:sign_in, keys: added_attrs)
  end
end

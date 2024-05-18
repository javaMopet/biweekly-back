# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::API
  include GraphqlDevise::SetUserByToken
  before_action -> { set_resource_by_token(User) }

  # Funcion para revisar usuario autenticado
  def authenticate_user_from_token!
    # Verifica si el usuario esta autenticado a partir del token
    return if current_user

    render json: { error: 'Usuario no autenticado' }, status: :unauthorized
  end

  private

  def current_user
    context = gql_devise_context(User)
    context[:current_resource]
  end

  # To enable sign in to function correctly.
  # skip_before_action :verify_authenticity_token, only: :create
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # protected
  # # Restrict parameters for sign up input.
  # def configure_permitted_parameters
  #   added_attrs = %i[email encrypted_password name]
  #   devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
  #   devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  #   devise_parameter_sanitizer.permit(:sign_in, keys: added_attrs)
  # end

  # def current_user
  #   gql_devise_context(User)[:current_resource]
  # end
end

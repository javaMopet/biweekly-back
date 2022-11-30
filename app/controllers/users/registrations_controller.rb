class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: {
        status: { code: 200, message: 'Signed up successfully', data: resource }
      }
    else
      render json: { data: { message: 'User could not be created',
        errors: resource.errors.full_messages }, status: :unprocessable_entity }
    end
  end

  def register_success
    render json: {
      message: 'Signed up successfully',
      user: current_user
    }, status: :ok
  end

  def register_failed
    articulos = Articulo.find
    # render json: { message: 'Something went wrong.' }, status: :uprocessable_entity
    render articulos
  end
end

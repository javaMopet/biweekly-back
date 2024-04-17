# frozen_string_literal: true

module Resolvers
  module Users
    # Resolver para obtener la lista de usuarios
    class UsersList < Resolvers::Base
      type [Types::UserType], null: false

      # Obtener lista de usuarios
      def resolve
        # instance_id =
        #   if current_user.nil?
        #     1
        #   else
        #     current_user.instance.id
        #   end
        # Obtener usuario super user y mostrar todos de todas las instancias

        query = User.includes(:instance, :roles)

        # Obtener usuario super user y mostrar todos de todas las instancias
        query = query.where(instance_id: current_user.instance.id) unless current_user.has_role? :superuser

        query.order(:id).all
      end
    end
  end
end
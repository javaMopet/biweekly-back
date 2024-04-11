# frozen_string_literal: true

module Resolvers
  module Users
    # Resolver para obtener la lista de usuarios
    class UsersList < Resolvers::Base
      type [Types::UserType], null: false

      # Obtener lista de usuarios
      def resolve
        User.includes(:instance, :roles).where(instance_id: current_user.instance.id).all
      end
    end
  end
end
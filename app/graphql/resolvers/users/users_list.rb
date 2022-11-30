# frozen_string_literal: true

module Resolvers
  module Users
    # Resolver para obtener la lista de usuarios
    class UsersList < Resolvers::Base
      type [Types::UserType], null: false

      def resolve
        User.all
      end
    end
  end
end
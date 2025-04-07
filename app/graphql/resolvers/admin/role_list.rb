# frozen_string_literal: true

module Resolvers
  module Admin
    # Resolver para obtener la lista de categorias
    class RoleList < Resolvers::Base
      type [Types::RoleType], null: false

      # argument :id, ID, required: false
      # Default method
      def resolve
        # p id
        # por ahora devuelve todo
        Role.all
      end
    end
  end
end

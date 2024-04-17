# frozen_string_literal: true

module Resolvers
  module Admin
    # Resolver para obtener la lista de categorias
    class InstanceList < Resolvers::Base
      type [Types::InstanceType], null: false

      # argument :id, ID, required: false
      # Default method
      def resolve
        # p id
        # por ahora devuelve todo
        Instance.all
      end
    end
  end
end

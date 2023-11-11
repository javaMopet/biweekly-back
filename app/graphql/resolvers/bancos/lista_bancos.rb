# frozen_string_literal: true

module Resolvers
  module Bancos
    # Resolver para obtener la lista de categorias
    class ListaBancos < Resolvers::Base
      type [Types::BancoType], null: false

      argument :id, ID, required: false
      # Default method
      def resolve(id:)
        p id
        # por ahora devuelve todo
        Banco.all
      end
    end
  end
end

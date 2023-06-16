# frozen_string_literal: true

module Resolvers
  module Bancos
    # Resolver para obtener la lista de categorias
    class ListaBancos < Resolvers::Base
      type [Types::BancoType], null: false

      def resolve
        Banco.all
      end
    end
  end
end

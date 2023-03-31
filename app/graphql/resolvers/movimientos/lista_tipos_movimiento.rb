# frozen_string_literal: true

module Resolvers
  module Movimientos
    # Resolver para obtener la lista de categorias
    class ListaTiposMovimiento < Resolvers::Base
      type [Types::TipoMovimientoType], null: false

      def resolve
        TipoMovimiento.all
      end
    end
  end
end
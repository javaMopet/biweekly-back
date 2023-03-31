# frozen_string_literal: true

module Resolvers
  module Movimientos
    # Resolver para obtener la lista de movimientos
    class ListaMovimientos < Resolvers::Base
      type [Types::DetalleMovimientoType], null: false

      def resolve
        DetalleMovimiento.includes(:movimiento, :categoria, :cuenta).all
      end
    end
  end
end

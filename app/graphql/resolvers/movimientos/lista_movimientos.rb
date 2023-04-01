# frozen_string_literal: true

module Resolvers
  module Movimientos
    # Resolver para obtener la lista de movimientos
    class ListaMovimientos < Resolvers::Base
      type [Types::MovimientoType], null: false

      def resolve
        Movimiento.includes(:tipo_movimiento,
                            detalles_movimiento: %i[categoria cuenta cuenta_contable]).all
      end
    end
  end
end

# frozen_string_literal: true

module Resolvers
  module RegistrosTarjeta
    # Resolver para obtener la lista de movimientos
    class ListaRegistrosTarjeta < Resolvers::Base
      type [Types::RegistroTarjetaType], null: false

      argument :cuenta_id, ID, required: false
      argument :fecha_inicio, GraphQL::Types::ISO8601Date, required: true
      argument :fecha_fin, GraphQL::Types::ISO8601Date, required: true

      def resolve(cuenta_id:, fecha_inicio:, fecha_fin:)
        registros = RegistroTarjeta.includes(:estado_registro_tarjeta, :cuenta, :categoria)
        registros = registros.where(cuenta_id:) if cuenta_id
        registros = registros.where(fecha: fecha_inicio..fecha_fin)
        registros.all
      end
    end
  end
end

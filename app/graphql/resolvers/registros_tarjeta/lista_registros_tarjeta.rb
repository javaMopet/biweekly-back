# frozen_string_literal: true

module Resolvers
  module RegistrosTarjeta
    # Resolver para obtener la lista de movimientos
    class ListaRegistrosTarjeta < Resolvers::Base
      type [Types::RegistroTarjetaType], null: false

      argument :cuenta_id, ID, required: false
      argument :fecha_inicio, GraphQL::Types::ISO8601Date, required: true
      argument :fecha_fin, GraphQL::Types::ISO8601Date, required: true
      argument :is_msi, Boolean, required: false
      argument :estado_registro_tarjeta_id, ID, required: false

      def resolve(cuenta_id:, fecha_inicio:, fecha_fin:, is_msi:, estado_registro_tarjeta_id:)
        registros = RegistroTarjeta.includes(:estado_registro_tarjeta, :cuenta, :categoria)
        registros = registros.where(cuenta_id:) if cuenta_id
        registros = registros.where(estado_registro_tarjeta_id:) if estado_registro_tarjeta_id
        registros = registros.where(fecha: fecha_inicio..fecha_fin)
        registros = registros.where(is_msi:) unless is_msi.nil?
        registros.order(fecha: :desc, id: :desc).all
      end
    end
  end
end

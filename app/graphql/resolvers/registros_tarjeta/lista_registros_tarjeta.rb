# frozen_string_literal: true

module Resolvers
  module RegistrosTarjeta
    # Resolver para obtener la lista de movimientos
    class ListaRegistrosTarjeta < Resolvers::Base
      type [Types::RegistroTarjetaType], null: false

      argument :cuenta_id, ID, required: true
      argument :fecha_inicio, GraphQL::Types::ISO8601Date, required: false
      argument :fecha_fin, GraphQL::Types::ISO8601Date, required: false
      argument :is_msi, Boolean, required: false
      argument :estado_registro_tarjeta_id, ID, required: false

      # Metodo resolver
      def resolve(cuenta_id:, is_msi:, estado_registro_tarjeta_id:, fecha_inicio: nil, fecha_fin: nil)
        # sleep(2)
        return [] if fecha_inicio.nil? || fecha_fin.nil?

        return [] if fecha_inicio > fecha_fin

        registros = RegistroTarjeta.includes(:estado_registro_tarjeta, :cuenta, :categoria).where(cuenta_id:)
        registros = registros.where(estado_registro_tarjeta_id:) if estado_registro_tarjeta_id
        registros = registros.where(fecha: fecha_inicio..fecha_fin)
        registros = registros.where(is_msi:) unless is_msi.nil?
        registros.order(fecha: :asc, id: :desc)
      end
    end
  end
end

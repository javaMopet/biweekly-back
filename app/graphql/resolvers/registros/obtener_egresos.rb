# frozen_string_literal: true

module Resolvers
  module Registros
    # Resolver para obtener la lista de registros de egreso de acuerdo a los argumentos
    class ObtenerEgresos < Resolvers::Base
      type [Types::EgresoType], null: false

      argument :categoria_id, ID, required: false
      argument :cuenta_id, ID, required: false
      argument :fecha_inicio, GraphQL::Types::ISO8601Date, required: true
      argument :fecha_fin, GraphQL::Types::ISO8601Date, required: true

      def resolve(categoria_id:, cuenta_id:, fecha_inicio:, fecha_fin:)
        p cuenta_id
        listado = Egreso.includes(:registro, :cuenta, :categoria).joins(:registro)
        listado = listado.where(categoria_id:) if categoria_id
        listado = listado.where(cuenta_id:) if cuenta_id
        listado = listado.where(registros: { fecha: fecha_inicio..fecha_fin })
        listado.all
      end
    end
  end
end

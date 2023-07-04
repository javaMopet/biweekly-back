# frozen_string_literal: true

module Resolvers
  module Cuentas
    # Resolver para obtener la lista de registros de acuerdo a los argumentos
    class ObtenerSaldoAFecha < Resolvers::Base
      type Float, null: false

      argument :cuenta_id, ID, required: true
      # argument :fecha_inicio, GraphQL::Types::ISO8601Date, required: true
      argument :fecha_fin, GraphQL::Types::ISO8601Date, required: true

      def resolve(cuenta_id:, fecha_fin:)
        Registro.where(cuenta_id:)
                .where(fecha: ..fecha_fin)
                .sum(&:importe)
      end
    end
  end
end

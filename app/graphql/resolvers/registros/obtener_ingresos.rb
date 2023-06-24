# frozen_string_literal: true

module Resolvers
  module Registros
    # Resolver para obtener la lista de registros de acuerdo a los argumentos
    class ObtenerIngresos < Resolvers::Base
      type [Types::IngresoType], null: false

      argument :categoria_id, ID, required: true
      argument :fecha_inicio, GraphQL::Types::ISO8601Date, required: true
      argument :fecha_fin, GraphQL::Types::ISO8601Date, required: true

      def resolve(categoria_id:, fecha_inicio:, fecha_fin:)
        Registro.where(categoria_id:)
                .where(registros: { fecha: fecha_inicio..fecha_fin })
                .all
      end
    end
  end
end

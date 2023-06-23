# frozen_string_literal: true

module Resolvers
  module Registros
    # Resolver para obtener la lista de registros de acuerdo a los argumentos
    class ObtenerRegistros < Resolvers::Base
      type [Types::RegistroType], null: false

      argument :cuenta_id, ID, required: true
      # argument :categoria_id, ID, required: false
      argument :fecha_inicio, GraphQL::Types::ISO8601Date, required: true
      argument :fecha_fin, GraphQL::Types::ISO8601Date, required: true

      def resolve(cuenta_id:, fecha_inicio:, fecha_fin:)
        query = Cuenta.find(cuenta_id).registros
        query = query.where(fecha: fecha_inicio..fecha_fin)
        query.all
      end
    end
  end
end

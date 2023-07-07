# frozen_string_literal: true

module Resolvers
  module Registros
    # Resolver para obtener la lista de registros de acuerdo a los argumentos
    class ObtenerRegistros < Resolvers::Base
      type [Types::RegistroType], null: false

      argument :cuenta_id, ID, required: false
      argument :categoria_id, ID, required: false
      argument :fecha_inicio, GraphQL::Types::ISO8601Date, required: true
      argument :fecha_fin, GraphQL::Types::ISO8601Date, required: true

      def resolve(cuenta_id:, categoria_id:, fecha_inicio:, fecha_fin:)
        query = Registro.includes(:cuenta, :categoria, { registro_tarjeta: :cuenta }).where(fecha: fecha_inicio..fecha_fin)
        query = query.where(cuenta_id:) if cuenta_id
        query = query.where(categoria_id:) if categoria_id
        query.order(:fecha).all
      end
    end
  end
end

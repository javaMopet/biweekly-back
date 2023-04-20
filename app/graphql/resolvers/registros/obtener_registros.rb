# frozen_string_literal: true

module Resolvers
  module Registros
    # Resolver para obtener la lista de registros de acuerdo a los argumentos
    class ObtenerRegistros < Resolvers::Base
      type [Types::RegistroType], null: false

      argument :categoria_id, ID, required: true
      argument :fecha_inicio, GraphQL::Types::ISO8601Date, required: true
      argument :fecha_fin, GraphQL::Types::ISO8601Date, required: true

      def resolve(categoria_id:, fecha_inicio:, fecha_fin:)
        p categoria_id
        p fecha_inicio
        p fecha_fin
        categoria = Categoria.find(categoria_id)
        p categoria
        Registro.all
      end
    end
  end
end

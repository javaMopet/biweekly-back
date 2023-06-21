# frozen_string_literal: true

module Resolvers
  module Categorias
    # Resolver para obtener la lista de categorias
    class CategoriaById < Resolvers::Base
      type Types::Categorias::CategoriaType, null: false

      argument :id, ID, required: true

      def resolve(id:)
        Categoria.includes(:tipo_movimiento, :cuenta_contable, :cuenta_default).find(id)
      end
    end
  end
end

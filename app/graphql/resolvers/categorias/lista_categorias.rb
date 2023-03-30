# frozen_string_literal: true

module Resolvers
  module Categorias
    # Resolver para obtener la lista de categorias
    class ListaCategorias < Resolvers::Base
      type [Types::Categorias::CategoriaType], null: false

      def resolve
        Categoria.includes(:tipo_categoria, :cuenta_contable).all
      end
    end
  end
end
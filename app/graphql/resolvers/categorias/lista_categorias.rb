# frozen_string_literal: true

module Resolvers
  module Categorias
    # Resolver para obtener la lista de categorias
    class ListaCategorias < Resolvers::Base
      type [Types::Categorias::CategoriaType], null: false

      # Metodo resolver
      def resolve
        Categoria.includes(:tipo_movimiento, :cuenta_contable).where(instance_id: current_user.instance.id).all
      end
    end
  end
end

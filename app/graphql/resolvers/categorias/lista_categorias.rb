# frozen_string_literal: true

module Resolvers
  module Categorias
    # Resolver para obtener la lista de categorias
    class ListaCategorias < Resolvers::Base
      type [Types::Categorias::CategoriaType], null: false

      argument :instance_id, ID, required: true

      # Metodo resolver
      def resolve(instance_id:)
        instance = current_user.instances.find_by(id: instance_id)
        raise GraphQL::ExecutionError, "No tienes acceso a esta instancia" if instance.nil?

        Categoria.includes(:tipo_movimiento, :cuenta_contable).where(instance_id: instance.id).all
      end
    end
  end
end

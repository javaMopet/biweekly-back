# frozen_string_literal: true

module Mutations
  module Categorias
    # Creacion de categorias
    class CategoriaCreate < BaseMutation
      description 'Creates a new categoria'

      field :categoria, Types::Categorias::CategoriaType, null: false

      argument :categoria_input, Types::Categorias::CategoriaInputType, required: true
      argument :instance_id, ID, required: true

      # Default method
      def resolve(categoria_input:, instance_id:)
        instance = current_user.instances.find_by(id: instance_id)
        raise GraphQL::ExecutionError, "No tienes acceso a esta instancia" if instance.nil?

        categoria = ::Categoria.new(**categoria_input)

        authorize!(:save, categoria)

        categoria.user_id = current_user.id
        categoria.instance_id = instance.id

        unless categoria.save
          raise GraphQL::ExecutionError.new "Error creating categoria", extensions: categoria.errors.to_hash
        end

        { categoria: }
      end
    end
  end
end

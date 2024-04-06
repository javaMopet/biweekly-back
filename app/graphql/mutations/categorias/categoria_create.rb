# frozen_string_literal: true

module Mutations
  module Categorias
    # Creacion de categorias
    class CategoriaCreate < BaseMutation
      description 'Creates a new categoria'

      field :categoria, Types::Categorias::CategoriaType, null: false

      argument :categoria_input, Types::Categorias::CategoriaInputType, required: true

      # Default method
      def resolve(categoria_input:)
        categoria = ::Categoria.new(**categoria_input)

        categoria.user_id = current_user.id
        categoria.instance_id = current_user.instance.id

        unless categoria.save
          raise GraphQL::ExecutionError.new "Error creating categoria", extensions: categoria.errors.to_hash
        end

        { categoria: }
      end
    end
  end
end

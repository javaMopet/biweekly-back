# frozen_string_literal: true

module Mutations
  module Categorias
    # Creación de categorias
    class CategoriaCreate < BaseMutation
      description 'Creates a new categoria'

      field :categoria, Types::Categorias::CategoriaType, null: false

      argument :categoria_input, Types::Categorias::CategoriaInputType, required: true

      def resolve(categoria_input:)
        categoria = ::Categoria.new(**categoria_input)
        unless categoria.save
          raise GraphQL::ExecutionError
            .new "Error creating categoria #{categoria.errors.full_messages}",
                 extensions: categoria.errors.to_hash
        end

        { categoria: }
      end
    end
  end
end

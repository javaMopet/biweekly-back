# frozen_string_literal: true

module Mutations
  module Categorias
    class CategoriaCreate < BaseMutation
      description "Creates a new categoria"

      field :categoria, Types::Categorias::CategoriaType, null: false

      argument :categoria_input, Types::Categorias::CategoriaInputType, required: true

      def resolve(categoria_input:)
        categoria = ::Categoria.new(**categoria_input)
        raise GraphQL::ExecutionError.new "Error creating categoria", extensions: categoria.errors.to_hash unless categoria.save

        { categoria: categoria }
      end
    end
  end
end

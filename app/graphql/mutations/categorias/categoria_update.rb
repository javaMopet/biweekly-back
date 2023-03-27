# frozen_string_literal: true

module Mutations
  module Categorias
    class CategoriaUpdate < BaseMutation
      description "Updates a categoria by id"

      field :categoria, Types::Categorias::CategoriaType, null: false

      argument :id, ID, required: true
      argument :categoria_input, Types::Categorias::CategoriaInputType, required: true

      def resolve(id:, categoria_input:)
        categoria = ::Categoria.find(id)
        raise GraphQL::ExecutionError.new "Error updating categoria", extensions: categoria.errors.to_hash unless categoria.update(**categoria_input)

        { categoria: categoria }
      end
    end
  end
end

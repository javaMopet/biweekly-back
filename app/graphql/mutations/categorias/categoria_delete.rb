# frozen_string_literal: true

module Mutations
  module Categorias
    class CategoriaDelete < BaseMutation
      description "Deletes a categoria by ID"

      field :categoria, Types::Categorias::CategoriaType, null: false

      argument :id, ID, required: true

      def resolve(id:)
        categoria = ::Categoria.find(id)
        raise GraphQL::ExecutionError.new "Error deleting categoria", extensions: categoria.errors.to_hash unless categoria.destroy

        { categoria: categoria }
      end
    end
  end
end

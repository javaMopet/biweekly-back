# frozen_string_literal: true

module Mutations
  module Categorias
    class CategoriaUpdate < BaseMutation
      description "Updates a categoria by id"

      field :categoria, Types::Categorias::CategoriaType, null: false

      argument :id, ID, required: true
      argument :categoria_input, Types::Categorias::CategoriaInputType, required: true

      # main resolver
      def resolve(id:, categoria_input:)
        categoria = ::Categoria.find(id)

        unless can? :update, categoria
          raise GraphQL::ExecutionError.new "error: unauthorized access: update 'categoria'",
                                            extensions: { code: :unauthorized }
        end

        unless categoria.update(**categoria_input)
          raise GraphQL::ExecutionError.new "Error updating categoria", extensions: categoria.errors.to_hash
        end

        { categoria: categoria }
      end
    end
  end
end

# frozen_string_literal: true

module Mutations
  module Categorias
    class CategoriaDelete < BaseMutation
      description "Deletes a categoria by ID"

      field :categoria, Types::Categorias::CategoriaType, null: false

      argument :id, ID, required: true

      # default method
      def resolve(id:)
        begin
          categoria = ::Categoria.find(id)

          unless can? :destroy, categoria
            raise GraphQL::ExecutionError.new "error: unauthorized access: delete 'categoria'",
                                              extensions: { code: :unauthorized }
          end

          categoria.destroy
        rescue ActiveRecord::InvalidForeignKey => e
          raise GraphQL::ExecutionError.new(e.message, extensions: [{ code: 110, from: 'Categorias' }])
        rescue StandardError => e
          # se lanza con networkError
          raise GraphQL::ExecutionError.new(
            "Error al intentar eliminar el banco #{e.message}",
            extensions: [{ code: 115, from: 'Bancos' }]
          )
        end

        { categoria: categoria }
      end
    end
  end
end

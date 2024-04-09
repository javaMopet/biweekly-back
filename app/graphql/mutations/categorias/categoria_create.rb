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

        # current_user.has_role :admin

        unless current_user.has_any_role? :admin, :manager
          raise GraphQL::ExecutionError.new "Not permited", extensions: [nothing: 'nothing']
        end

        # abilities = Ability.new(current_user)
        # p abilities
        categoria.user_id = current_user.id
        categoria.instance_id = current_user.instance.id
        # if abilities.can? :save, categoria
        unless categoria.save
          raise GraphQL::ExecutionError.new "Error creating categoria", extensions: categoria.errors.to_hash
        end

        # end
        { categoria: }
      end
    end
  end
end

# frozen_string_literal: true

module Resolvers
  module Categorias
    # Resolver para obtener la lista de categorias
    class ListaTiposCategoria < Resolvers::Base
      type [Types::Categorias::TipoCategoriaType], null: false

      def resolve
        TipoCategoria.all
      end
    end
  end
end
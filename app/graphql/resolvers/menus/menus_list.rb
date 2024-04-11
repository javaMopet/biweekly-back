# frozen_string_literal: true

module Resolvers
  module Menus
    # Resolver para obtener la lista de categorias
    class MenusList < Resolvers::Base
      type [Types::MenuType], null: false

      # Default method
      def resolve
        # por ahora devuelve todo
        Menu.all.order(:orden)
      end
    end
  end
end

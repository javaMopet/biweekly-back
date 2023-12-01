# frozen_string_literal: true

module Resolvers
  module Traspasos
    # Resolver para obtener la lista de movimientos
    class ListaTraspasos < Resolvers::Base
      type [Types::TraspasoType], null: false

      argument :id, ID, required: false

      # Metodo resolver
      def resolve(id:)
        traspasos = Traspaso.includes(traspaso_detalles: %i[cuenta registro])
        traspasos = traspasos.where(id:) if id
        traspasos.all
      end
    end
  end
end

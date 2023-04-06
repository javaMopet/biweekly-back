# frozen_string_literal: true

module Resolvers
  module Cuentas
    # Resolver para obtener la lista de tipos de cuenta
    class ListaTiposCuenta < Resolvers::Base
      type [Types::TipoCuentaType], null: false

      def resolve
        TipoCuenta.all
      end
    end
  end
end

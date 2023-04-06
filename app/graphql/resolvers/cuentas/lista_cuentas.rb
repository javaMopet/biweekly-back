# frozen_string_literal: true

module Resolvers
  module Cuentas
    # Resolver para obtener la lista de cuentas 
    class ListaCuentas < Resolvers::Base
      type [Types::Cuentas::CuentaType], null: false

      def resolve
        Cuenta.includes(:cuenta_contable).all
      end
    end
  end
end
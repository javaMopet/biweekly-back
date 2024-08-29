# frozen_string_literal: true

module Resolvers
  module Cuentas
    # Resolver para obtener la lista de cuentas
    class CuentaById < Resolvers::Base
      type Types::Cuentas::CuentaType, null: false

      argument :id, ID, required: true

      # Default method
      def resolve(id:)
        Cuenta.includes(:cuenta_contable, :tipo_cuenta, :banco).find(id)
      end
    end
  end
end

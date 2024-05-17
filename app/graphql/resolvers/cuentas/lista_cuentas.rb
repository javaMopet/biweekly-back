# frozen_string_literal: true

module Resolvers
  module Cuentas
    # Resolver para obtener la lista de cuentas
    class ListaCuentas < Resolvers::Base
      type [Types::Cuentas::CuentaType], null: false

      # argument :id, ID, required: false

      # Default method
      def resolve
        cuentas = Cuenta.includes(:cuenta_contable, :tipo_cuenta, :banco).where(instance_id: current_user.instance_id)
        # cuentas = cuentas.where(id:) if id
        cuentas.all
      end
    end
  end
end

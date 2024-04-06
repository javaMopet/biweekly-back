# frozen_string_literal: true

module Resolvers
  module Cuentas
    # Resolver para obtener la lista de cuentas
    class ListaCuentas < Resolvers::Base
      type [Types::Cuentas::CuentaType], null: false

      argument :instance_id, ID, required: true
      
      # Default method
      def resolve
        Cuenta.includes(:cuenta_contable, :tipo_cuenta, :banco).where(instance_id: current_user.instance_id).all
      end
    end
  end
end

# frozen_string_literal: true

module Resolvers
  module Cuentas
    # Resolver para obtener la lista de cuentas
    class ListaCuentas < Resolvers::Base
      type [Types::Cuentas::CuentaType], null: false

      argument :instance_id, ID, required: true

      # Default method
      def resolve(instance_id:)
        instance = current_user.instances.where(id: instance_id).first
        raise GraphQL::ExecutionError, "No tienes acceso a esta instancia" if instance.nil?

        cuentas = Cuenta.includes(:cuenta_contable, :tipo_cuenta, :banco).where(instance_id: instance.id)

        # return cuentas if context[:current_user].has_role?(:admin)
        # cuentas = cuentas.where(id:) if id
        cuentas.all
      end
    end
  end
end

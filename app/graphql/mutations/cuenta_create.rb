# frozen_string_literal: true

module Mutations
  # Creacion de cuentas
  class CuentaCreate < BaseMutation
    description 'Creates a new cuenta'

    field :cuenta, Types::Cuentas::CuentaType, null: false

    argument :cuenta_input, Types::Cuentas::CuentaInputType, required: true
    argument :instance_id, ID, required: true

    # default method
    def resolve(cuenta_input:, instance_id:)
      instance = current_user.instances.where(id: instance_id).first
      raise GraphQL::ExecutionError, "No tienes acceso a esta instancia" if instance.nil?

      cuenta = ::Cuenta.new(**cuenta_input)

      cuenta.user_id = current_user.id
      cuenta.instance_id = instance.id

      authorize!(:save, cuenta)

      unless cuenta.save
        raise GraphQL::ExecutionError.new "Error creating cuenta #{cuenta.errors.full_messages}",
                                          extensions: cuenta.errors.to_hash
      end

      { cuenta: }
    end
  end
end

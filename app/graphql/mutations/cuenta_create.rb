# frozen_string_literal: true

module Mutations
  # Creacion de cuentas
  class CuentaCreate < BaseMutation
    description 'Creates a new cuenta'

    field :cuenta, Types::Cuentas::CuentaType, null: false

    argument :cuenta_input, Types::Cuentas::CuentaInputType, required: true

    def resolve(cuenta_input:)
      cuenta = ::Cuenta.new(**cuenta_input)
      unless cuenta.save
        raise GraphQL::ExecutionError.new 'Error creating cuenta', extensions: cuenta.errors.to_hash
      end

      { cuenta: }
    end
  end
end

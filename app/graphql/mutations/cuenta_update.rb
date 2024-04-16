# frozen_string_literal: true

module Mutations
  class CuentaUpdate < BaseMutation
    description "Updates a cuenta by id"

    field :cuenta, Types::Cuentas::CuentaType, null: false

    argument :id, ID, required: true
    argument :cuenta_input, Types::Cuentas::CuentaInputType, required: true

    # default method
    def resolve(id:, cuenta_input:)
      cuenta = ::Cuenta.find(id)

      unless can? :update, cuenta
        raise GraphQL::ExecutionError.new "error: unauthorized access: update 'cuenta'",
                                          extensions: { code: :unauthorized }
      end

      unless cuenta.update(**cuenta_input)
        raise GraphQL::ExecutionError.new "Error updating cuenta", extensions: cuenta.errors.to_hash
      end

      { cuenta: cuenta }
    end
  end
end

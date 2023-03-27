# frozen_string_literal: true

module Mutations
  class CuentaUpdate < BaseMutation
    description "Updates a cuenta by id"

    field :cuenta, Types::Cuentas::CuentaType, null: false

    argument :id, ID, required: true
    argument :cuenta_input, Types::Cuentas::CuentaInputType, required: true

    def resolve(id:, cuenta_input:)
      cuenta = ::Cuenta.find(id)
      raise GraphQL::ExecutionError.new "Error updating cuenta", extensions: cuenta.errors.to_hash unless cuenta.update(**cuenta_input)

      { cuenta: cuenta }
    end
  end
end

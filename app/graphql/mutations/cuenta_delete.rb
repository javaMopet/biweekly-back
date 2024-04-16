# frozen_string_literal: true

module Mutations
  class CuentaDelete < BaseMutation
    description "Deletes a cuenta by ID"

    field :cuenta, Types::Cuentas::CuentaType, null: false

    argument :id, ID, required: true

    # main resolver
    def resolve(id:)
      cuenta = ::Cuenta.find(id)
      unless can? :destroy, cuenta
        raise GraphQL::ExecutionError.new "error: unauthorized access: delete 'cuenta'",
                                          extensions: { code: :unauthorized }
      end
      raise GraphQL::ExecutionError.new "Error deleting cuenta", extensions: cuenta.errors.to_hash unless cuenta.destroy

      { cuenta: cuenta }
    end
  end
end

# frozen_string_literal: true

module Mutations
  # Creación de cuentas contables
  class CuentaContableCreate < BaseMutation
    description 'Creates a new cuenta_contable'

    field :cuenta_contable, Types::CuentaContableType, null: false

    argument :cuenta_contable_input, Types::CuentaContableInputType, required: true

    def resolve(cuenta_contable_input:)
      cuenta_contable = ::CuentaContable.new(**cuenta_contable_input)
      unless cuenta_contable.save
        raise GraphQL::ExecutionError.new 'Error creating ' \
                                          "cuenta_contable #{cuenta_contable.errors.full_messages}",
                                          extensions: cuenta_contable.errors.to_hash
      end

      { cuenta_contable: }
    end
  end
end

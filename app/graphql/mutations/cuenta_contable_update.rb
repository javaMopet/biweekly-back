# frozen_string_literal: true

module Mutations
  # Actualizacion de una cuenta contable
  class CuentaContableUpdate < BaseMutation
    description 'Updates a cuenta_contable by id'

    field :cuenta_contable, Types::CuentaContableType, null: false

    argument :id, ID, required: true
    argument :cuenta_contable_input, Types::CuentaContableInputType, required: true

    # main method
    def resolve(id:, cuenta_contable_input:)
      cuenta_contable = ::CuentaContable.find(id)

      authorize!(:update, cuenta_contable)

      unless cuenta_contable.update(**cuenta_contable_input)
        raise GraphQL::ExecutionError.new 'Error updating cuenta_contable', extensions: cuenta_contable.errors.to_hash
      end

      { cuenta_contable: }
    end
  end
end

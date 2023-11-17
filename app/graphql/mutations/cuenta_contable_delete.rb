# frozen_string_literal: true

module Mutations
  # Eliminacion de una cuenta contable
  class CuentaContableDelete < BaseMutation
    description 'Deletes a cuenta_contable by ID'

    field :cuenta_contable, Types::CuentaContableType, null: false

    argument :id, ID, required: true

    # default method
    def resolve(id:)
      cuenta_contable = ::CuentaContable.find(id)
      unless cuenta_contable.destroy
        p 'Error >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
        p cuenta_contable.errors
        raise GraphQL::ExecutionError.new 'Error deleting cuenta_contable', extensions: cuenta_contable.errors.to_hash
      end
      p 'not Error >>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<'
      { cuenta_contable: }
    end
  end
end

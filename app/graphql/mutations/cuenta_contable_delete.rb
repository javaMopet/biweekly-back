# frozen_string_literal: true

module Mutations
  # Eliminación de una cuenta contable
  class CuentaContableDelete < BaseMutation
    description 'Deletes a cuenta_contable by ID'

    field :cuenta_contable, Types::CuentaContableType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      cuenta_contable = ::CuentaContable.find(id)
      unless cuenta_contable.destroy
        raise GraphQL::ExecutionError.new 'Error deleting cuenta_contable',
                                          extensions: cuenta_contable.errors.to_hash
      end

      { cuenta_contable: }
    end
  end
end

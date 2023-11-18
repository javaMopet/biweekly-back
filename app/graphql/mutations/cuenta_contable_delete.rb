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
      cuenta_contable.destroy

      { cuenta_contable: }
    rescue ActiveRecord::InvalidForeignKey => e
      raise GraphQL::ExecutionError.new(e.message, extensions: [{ code: 110, from: 'Cuentas Contables' }])
    rescue StandardError => e
      raise GraphQL::ExecutionError.new(
        "Error al intentar eliminar el banco #{e.message}",
        extensions: [{ code: 115, from: 'Bancos' }]
      )
    end
  end
end

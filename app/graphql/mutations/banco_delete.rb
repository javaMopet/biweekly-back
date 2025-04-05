# frozen_string_literal: true

module Mutations
  class BancoDelete < BaseMutation
    description "Deletes a banco by ID"

    field :banco, Types::BancoType, null: false

    argument :id, ID, required: true

    # main method
    def resolve(id:)
      begin
        banco = ::Banco.find(id)
        authorize!(:destroy, banco)

        banco.destroy
      rescue ActiveRecord::InvalidForeignKey => e
        raise GraphQL::ExecutionError.new(e.message, extensions: [{ code: 110, from: 'Bancos' }])
      rescue StandardError => e
        p e.message
        # se lanza con networkError
        raise GraphQL::ExecutionError.new(
          "Error al intentar eliminar el banco #{e.message}",
          extensions: [{ code: 115, from: 'Bancos' }]
        )
      end

      # anterior
      # raise GraphQL::ExecutionError.new("Error deleting banco", extensions: [{code: 101, from: 'Bancos'}])
      # unless banco.destroy

      { banco: }
    end
  end
end

# frozen_string_literal: true

module Mutations
  class RegistrosDelete < BaseMutation
    include UpdateAccountBalance
    description "Deletes a registros by IDs"

    field :registros, [Types::RegistroType], null: false

    argument :ids, String, required: true

    # Metodo revolver
    def resolve(ids:)
      ActiveRecord::Base.transaction do
        p ids
        registros = Registro.where(id: ids.split(','))
        p 'hasta aqui todo bien '
        p registros
        # registros.destroy_all
        unless registros.destroy_all
          raise GraphQL::ExecutionError.new "Error deleting registro", extensions: Registro.errors.to_hash
        end

        # update_account_balance registro.cuenta.id

        { registros: }
      rescue StandardError => e
        puts e
        raise e
      end
    end
  end
end

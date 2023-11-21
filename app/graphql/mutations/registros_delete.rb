# frozen_string_literal: true

module Mutations
  class RegistrosDelete < BaseMutation
    include UpdateAccountBalance
    description "Deletes a registros by IDs"

    field :saldo, Float, null: false

    argument :ids, String, required: true

    # Metodo revolver
    def resolve(ids:)
      ActiveRecord::Base.transaction do
        # p ids
        registros = Registro.where(id: ids.split(','))
        cuenta_id = registros[0].cuenta.id
        # retorno = registros.dup
        # p 'hasta aqui todo bien '
        # p registros
        # registros.destroy_all
        unless registros.delete_all
          raise GraphQL::ExecutionError.new "Error deleting registro", extensions: Registro.errors.to_hash
        end

        cuenta = update_account_balance cuenta_id
        # p 'retornando registros-----------'
        # p retorno

        { saldo: cuenta.saldo }
      rescue StandardError => e
        raise GraphQL::ExecutionError.new(e.message, extensions: [{ code: 110, from: 'Registros' }])
      end
    end
  end
end

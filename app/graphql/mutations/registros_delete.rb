# frozen_string_literal: true

module Mutations
  class RegistrosDelete < BaseMutation
    include UpdateAccountBalance
    description "Deletes a registros by IDs"

    # field :saldo, Float, null: false
    field :cuentas_ids, [ID], null: false

    argument :ids, String, required: true

    # Metodo revolver
    def resolve(ids:)
      ActiveRecord::Base.transaction do
        registros = Registro.where(id: ids.split(','))
        cuentas_ids = []

        registros.each do |registro|
          if registro.traspaso_detalle.nil?
            cuentas_ids.push(registro.cuenta.id)
            registro.destroy
          else
            p "registro traspaso ..................................."
            traspaso =  ::Traspaso.find(registro.traspaso_detalle.traspaso_id)
            cuentas = traspaso.traspaso_detalles.map(&:cuenta_id)
            cuentas_ids.concat(cuentas)
            traspaso.traspaso_detalles.destroy_all
            traspaso.destroy
          end
        end

        p cuentas_ids.uniq

        # unless registros.delete_all
        #   raise GraphQL::ExecutionError.new "Error deleting registro", extensions: Registro.errors.to_hash
        # end

        cuenta = nil

        cuentas_ids.uniq.each do |cuenta_id|
          cuenta = update_account_balance cuenta_id
        end

        { cuentas_ids: cuentas_ids.uniq }
      rescue StandardError => e
        p e
        raise GraphQL::ExecutionError.new(e.message, extensions: [{ code: 110, from: 'Registros' }])
      end
    end
  end
end

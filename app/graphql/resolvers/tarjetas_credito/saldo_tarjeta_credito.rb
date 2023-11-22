# frozen_string_literal: true

module Resolvers
  module TarjetasCredito
    # Obtener el saldo final de una tarjeta de credito com msi
    class SaldoTarjetaCredito < Resolvers::Base
      type Float, null: false

      argument :cuenta_id, ID, required: true
      argument :fecha_fin, GraphQL::Types::ISO8601Date, required: false
      argument :is_detalle, Integer, required: true

      # default method
      def resolve(cuenta_id:, fecha_fin:, is_detalle:)
        fecha_final =
          if fecha_fin.nil?
            Time.current.to_date
          else
            fecha_fin
          end

        saldo_result = Pro::DataImport.saldo_tarjeta_credito(fecha_final, cuenta_id, is_detalle).first

        saldo = saldo_result["saldo"].nil? ? 0 : saldo_result["saldo"]

        if fecha_fin.nil?
          cuenta = Cuenta.find(cuenta_id)
          cuenta.update(saldo:)
        else
          p 'no se actualiza nada'
        end

        saldo
      end
    end
  end
end

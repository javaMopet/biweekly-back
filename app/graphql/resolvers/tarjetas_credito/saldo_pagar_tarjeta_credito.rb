# frozen_string_literal: true

module Resolvers
  module TarjetasCredito
    # Obtener el saldo a pagar en tarjeta de credito a la fecha final
    class SaldoPagarTarjetaCredito < Resolvers::Base
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

        saldo_final = RegistroTarjeta.where(cuenta_id:).where(fecha: ..fecha_final).where(is_msi: 0).sum(&:importe)
        p "Saldo a pagar: #{saldo_final}"
        saldo_final
      end
    end
  end
end

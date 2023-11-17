# frozen_string_literal: true

module UpdateAccountBalanceCredit
  extend ActiveSupport::Concern

  included do
    # Actualizar el saldo de tarjeta de credito
    def update_account_balance_credit(cuenta_id)
      cuenta = Cuenta.find(cuenta_id)
      saldo = cuenta.registros_tarjeta.sum(&:importe)

      cuenta.saldo = saldo * -1
      raise GraphQL::ExecutionError.new "Error updating cuenta", extensions: cuenta.errors.to_hash unless cuenta.save

      cuenta
    end
  end
end

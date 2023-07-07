# frozen_string_literal: true

module UpdateAccountBalance
  extend ActiveSupport::Concern

  included do
    def update_account_balance(cuenta_id)
      cuenta = Cuenta.find(cuenta_id)
      saldo = cuenta.registros.sum(&:importe)

      cuenta.saldo = saldo 
      raise GraphQL::ExecutionError.new "Error updating cuenta", extensions: cuenta.errors.to_hash unless cuenta.save
    end
  end
end

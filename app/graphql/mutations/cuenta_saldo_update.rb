# frozen_string_literal: true

module Mutations
  class CuentaSaldoUpdate < BaseMutation
    include UpdateAccountBalance
    include UpdateAccountBalanceCredit
    description "Actualizar el saldo de una cuenta"

    field :cuenta, Types::Cuentas::CuentaType, null: false

    argument :cuenta_id, ID, required: true

    # default method
    def resolve(cuenta_id:)
      cuenta = Cuenta.find(cuenta_id)
      cuenta_nueva = nil
      if cuenta.tipo_cuenta.id == 3
        p 'acutalizando tarjeta'
        cuenta_nueva = update_account_balance_credit cuenta_id
      else
        p 'actualizando cuenta de ahorro'
        cuenta_nueva = update_account_balance cuenta_id
      end

      { cuenta: cuenta_nueva }
    end
  end
end

# frozen_string_literal: true

module UpdateAccountBalance
  extend ActiveSupport::Concern

  included do
    def update_account_balance(cuenta_id)
      Cuenta.find(cuenta_id)
    end
  end
end

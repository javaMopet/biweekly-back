# frozen_string_literal: true

# Modelo para cuenta
class Cuenta < ApplicationRecord
  belongs_to :tipo_cuenta
  belongs_to :cuenta_contable
end

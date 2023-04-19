# frozen_string_literal: true

# Modelo registro
class Registro < ApplicationRecord
  belongs_to :estado_registro
  delegated_type :registrable, types: %w[Ingreso Egreso Transferencia], required: false

  validates :importe, presence: true
end

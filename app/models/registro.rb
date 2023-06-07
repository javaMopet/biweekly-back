# frozen_string_literal: true

# Modelo registro
class Registro < ApplicationRecord
  belongs_to :estado_registro
  belongs_to :cuenta, optional: true

  delegated_type :registrable, types: %w[Ingreso Egreso Inversion Transferencia], required: false
  delegate :nombre_completo, to: :registrable

  validates :importe, presence: true
end

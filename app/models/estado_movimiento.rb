# frozen_string_literal: true

# Model para el estado de un movimiento
class EstadoMovimiento < ApplicationRecord
  validates :nombre, presence: true, uniqueness: true, length: { minimum: 1, maximum: 30 }
end

# frozen_string_literal: true

# Modelos para los tipos de movimiento
class TipoMovimiento < ApplicationRecord
  validates :nombre, presence: true, uniqueness: true, length: { minimum: 1, maximum: 20 }
end

# frozen_string_literal: true

# Modelo para el detalle del movimiento
class DetalleMovimiento < ApplicationRecord
  belongs_to :movimiento
  belongs_to :categoria, optional: true
  belongs_to :cuenta, optional: true
  belongs_to :cuenta_contable

  # validates :movimiento_id, presence: true
  validates :importe, presence: true
  validates :tipo_afectacion, presence: true
  validates :tipo_detalle, presence: true
  validates :cuenta_contable_id, presence: true
end

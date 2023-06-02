# frozen_string_literal: true

# Modelo categoria
class Categoria < ApplicationRecord
  belongs_to :tipo_movimiento
  belongs_to :cuenta_contable
  belongs_to :cuenta_default, class_name: 'Cuenta', optional: true

  validates :tipo_movimiento, presence: true
  validates :nombre, presence: true
  validates :orden, presence: true
  # icono
  validates :descripcion, presence: true
  # color
  validates :cuenta_contable, presence: true
  # cuenta_default
  # importe_default
end

# frozen_string_literal: true

# Modelo categoria
class Categoria < ApplicationRecord
  resourcify

  belongs_to :tipo_movimiento
  belongs_to :cuenta_contable, optional: true
  belongs_to :cuenta_default, class_name: 'Cuenta', optional: true
  belongs_to :instance

  validates :tipo_movimiento, presence: true
  validates :nombre,
            presence: true,
            uniqueness: { scope: :instance_id, case_sensitive: false, message: 'Nombre repetido' }
  validates :orden, presence: true
  # icono
  # color
  # validates :cuenta_contable, presence: true
  # cuenta_default
  # importe_default
end

# frozen_string_literal: true

# Modelo registro
class Registro < ApplicationRecord
  belongs_to :estado_registro
  belongs_to :cuenta, optional: true
  belongs_to :categoria, optional: true
  belongs_to :registro_tarjeta, optional: true
  # belongs_to :tipo_cuenta_transferencia, optional: true

  # has_one :registro_tarjeta
  has_one :traspaso_detalle
  has_one :traspaso, through: :traspaso_detalle

  # delegated_type :registrable, types: %w[Ingreso Egreso Inversion Transferencia],
  # required: false, dependent: :destroy
  # delegate :nombre_completo, to: :registrable
  # delegate :categoria, to: :registrable

  validates :importe, presence: true
  validates :tipo_afectacion, presence: true

  def cargo
    tipo_afectacion == 'C' ? importe : 0
  end

  def abono
    tipo_afectacion == 'A' ? importe : 0
  end
end

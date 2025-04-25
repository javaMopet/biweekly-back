# frozen_string_literal: true

# Modelo para cuenta
class Cuenta < ApplicationRecord
  belongs_to :tipo_cuenta
  belongs_to :cuenta_contable, optional: true
  belongs_to :banco, optional: true
  belongs_to :instance

  has_many :registros
  # , dependent: :destroy
  has_many :registros_tarjeta
  # , dependent: :destroy
  has_many :pagos_tarjeta

  validates :nombre,
            presence: true,
            uniqueness: {
              scope: :instance_id,
              case_sensitive: false,
              message: "No se puede tomar un nombre previamente guardado."
            }
end

# frozen_string_literal: true

# Modelo para cuenta
class Cuenta < ApplicationRecord
  belongs_to :tipo_cuenta
  belongs_to :cuenta_contable
  belongs_to :banco, optional: true

  has_many :registros #, dependent: :destroy
  has_many :registros_tarjeta #, dependent: :destroy

  validates :nombre, presence: true, uniqueness: { case_sensitive: false }
end

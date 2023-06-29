class RegistroTarjeta < ApplicationRecord
  belongs_to :estado_registro_tarjeta
  belongs_to :cuenta
  belongs_to :categoria, optional: true
  belongs_to :registro, optional: true

  validates :registro, uniqueness: true, allow_blank: true
  validates :tipo_afectacion, presence: true
  validates :fecha, presence: true
  validates :importe, presence: true
end

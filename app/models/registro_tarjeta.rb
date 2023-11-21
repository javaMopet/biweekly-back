class RegistroTarjeta < ApplicationRecord
  belongs_to :estado_registro_tarjeta
  belongs_to :cuenta
  belongs_to :categoria, optional: true
  belongs_to :registro, optional: true

  validates :registro, uniqueness: true, allow_blank: true
  validates :tipo_afectacion, presence: true
  validates :fecha, presence: true
  validates :importe, presence: true

  # Obtener importe como cargo
  def cargo
    tipo_afectacion == 'C' ? importe * -1 : 0
  end

  # Obtener importe como abono
  def abono
    tipo_afectacion == 'A' ? importe : 0
  end
end

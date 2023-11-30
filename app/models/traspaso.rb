class Traspaso < ApplicationRecord
  belongs_to :user
  has_many :traspaso_detalles

  # obtener el detalle de origen del traspaso
  def detalle_origen
    traspaso_detalles.where(tipo_cuenta_traspaso_id: 1)
  end

  # obtener el detalle de destino del traspaso
  def detalle_destino
    traspaso_detalles.where(tipo_cuenta_traspaso_id: 2)
  end
end

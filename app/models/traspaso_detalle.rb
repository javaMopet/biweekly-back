class TraspasoDetalle < ApplicationRecord
  belongs_to :traspaso
  belongs_to :cuenta
  belongs_to :tipo_cuenta_traspaso
  belongs_to :registro, dependent: :destroy

  # obtener detalle contrario
  def contra_detalle
    if tipo_cuenta_traspaso_id == 1
      traspaso.detalle_destino
    else
      traspaso.detalle_origen
    end
  end
end

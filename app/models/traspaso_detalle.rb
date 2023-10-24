class TraspasoDetalle < ApplicationRecord
  belongs_to :traspaso
  belongs_to :cuenta
  belongs_to :tipo_cuenta_trasferencia
end

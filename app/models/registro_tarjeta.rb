class RegistroTarjeta < ApplicationRecord
  belongs_to :estado_registro_tarjeta
  belongs_to :cuenta
  belongs_to :categoria
end

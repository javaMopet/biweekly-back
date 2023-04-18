class Transferencia < ApplicationRecord
  belongs_to :cuenta_origen
  belongs_to :cuenta_destino
end

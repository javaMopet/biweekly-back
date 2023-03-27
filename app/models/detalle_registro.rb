class DetalleRegistro < ApplicationRecord
  belongs_to :registro
  belongs_to :cuenta_contable
end

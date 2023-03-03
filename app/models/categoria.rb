class Categoria < ApplicationRecord
  belongs_to :tipo_categoria
  belongs_to :cuenta_contable
end

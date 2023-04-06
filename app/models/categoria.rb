# frozen_string_literal: true

# Modelo categoria
class Categoria < ApplicationRecord
  belongs_to :tipo_movimiento
  belongs_to :cuenta_contable
  belongs_to :cuenta, optional: true
end

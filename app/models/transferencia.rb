# frozen_string_literal: true

# Modelo para tranferencia
class Transferencia < ApplicationRecord
  include Registrable

  belongs_to :cuenta_origen
  belongs_to :cuenta_destino
end

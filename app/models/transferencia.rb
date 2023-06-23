# frozen_string_literal: true

# Modelo para tranferencia
class Transferencia < ApplicationRecord
  include Registrable

  def categoria
    nil
  end
end

# frozen_string_literal: true

# Ingreso
class Ingreso < ApplicationRecord
  include Registrable

  belongs_to :categoria
  belongs_to :cuenta

  def nombre_completo
    'Hola mundo!'
  end 
end

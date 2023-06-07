# frozen_string_literal: true

# Ingreso
class Ingreso < ApplicationRecord
  include Registrable

  belongs_to :categoria  

  def nombre_completo
    'Hola mundo!'
  end 
end

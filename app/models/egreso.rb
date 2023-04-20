# frozen_string_literal: true

# Egreso
class Egreso < ApplicationRecord
  include Registrable
  
  belongs_to :categoria
  belongs_to :cuenta

  def nombre_completo
    "#{id} - #{categoria.nombre}"
  end 
end

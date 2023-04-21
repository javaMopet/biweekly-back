# frozen_string_literal: true

# Modelo Iversion
class Inversion < ApplicationRecord
  include Registrable
  belongs_to :categoria
  belongs_to :cuenta

  def nombre_completo
    'Hola mundo Inversion!'
  end
end

# frozen_string_literal: true

# Egreso
class Egreso < ApplicationRecord
  include Registrable
  
  belongs_to :categoria
  belongs_to :cuenta
end

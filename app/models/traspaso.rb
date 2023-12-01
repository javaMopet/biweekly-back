class Traspaso < ApplicationRecord
  belongs_to :user
  has_many :traspaso_detalles
end

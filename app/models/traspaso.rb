class Traspaso < ApplicationRecord
  belongs_to :user
  has_many :traspasos_detalle

end

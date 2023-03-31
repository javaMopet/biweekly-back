# frozen_string_literal: true

# Modelo movimiento
class Movimiento < ApplicationRecord
  belongs_to :estado_movimiento
  belongs_to :tipo_movimiento
  belongs_to :user

  has_many :detalles_movimiento

  validates :numero, presence: true
  validates :estado_movimiento_id, presence: true
  validates :tipo_movimiento_id, presence: true
  validates :fecha, presence: true
  validates :user_id, presence: true
end

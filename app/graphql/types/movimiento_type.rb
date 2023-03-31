# frozen_string_literal: true

module Types
  class MovimientoType < Types::BaseObject
    field :id, ID, null: false
    field :numero, Integer
    field :estado_movimiento_id, Integer, null: false
    field :tipo_movimiento_id, Integer, null: false
    field :fecha, GraphQL::Types::ISO8601Date
    field :obsevaciones, String
    field :user_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end

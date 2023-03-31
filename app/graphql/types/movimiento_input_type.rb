# frozen_string_literal: true

module Types
  class MovimientoInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :numero, Integer, required: false
    argument :estado_movimiento_id, Integer, required: false
    argument :tipo_movimiento_id, Integer, required: false
    argument :fecha, GraphQL::Types::ISO8601Date, required: false
    argument :obsevaciones, String, required: false
    argument :user_id, Integer, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end

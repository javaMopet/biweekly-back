# frozen_string_literal: true

module Types
  class RegistroInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :estado_registro_id, Integer, required: false
    argument :registrable_type, String, required: false
    argument :registrable_id, Integer, required: false
    argument :importe, Float, required: false
    argument :fecha, GraphQL::Types::ISO8601Date, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end

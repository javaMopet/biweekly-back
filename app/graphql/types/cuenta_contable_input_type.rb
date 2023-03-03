# frozen_string_literal: true

module Types
  class CuentaContableInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :nombre, String, required: false
    argument :tipo_afectacion, String, required: false
    argument :subnivel, Integer, required: false
    argument :padre_id, Integer, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end

# frozen_string_literal: true

module Types
  # Input Type para Egreso
  class EgresoInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :categoria_id, Integer, required: false
    argument :cuenta_id, Integer, required: false    
    argument :registro, Types::RegistroInputType, required: true
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end

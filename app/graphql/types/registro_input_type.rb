# frozen_string_literal: true

module Types
  # Graphql Input Type para Registro
  class RegistroInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :estado_registro_id, ID, required: false, default_value: 2
    argument :tipo_afectacion, String, required: true    
    argument :importe, Float, required: false    
    argument :fecha, GraphQL::Types::ISO8601Date, required: false
    argument :cuenta_id, ID, required: false
    argument :categoria_id, ID, required: false
    argument :observaciones, String, required: false
    argument :user_id, ID, required: true
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end

# frozen_string_literal: true

module Types
  # Input type para Transferencia.
  class TransferenciaInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :cuenta_origen_id, Integer, required: false
    argument :cuenta_destino_id, Integer, required: false
    argument :observaciones, String, required: false
    argument :registro, Types::RegistroInputType, required: true
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end

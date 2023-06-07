# frozen_string_literal: true

module Types
  # Input type para Transferencia.
  class TransferenciaInputType < Types::BaseInputObject
    argument :id, ID, required: false
    # Agregar el tipo de cuenta si es origen o destino
    argument :registro, Types::RegistroInputType, required: true
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end

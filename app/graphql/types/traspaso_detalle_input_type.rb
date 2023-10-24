# frozen_string_literal: true

module Types
  class TraspasoDetalleInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :traspaso_id, Integer, required: false
    argument :cuenta_id, Integer, required: false
    argument :tipo_cuenta_traspaso_id, Integer, required: false
    argument :importe, Float, required: false
    argument :registro_id, Integer, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end

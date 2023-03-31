# frozen_string_literal: true

module Types
  class DetalleMovimientoInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :movimiento_id, Integer, required: false
    argument :categoria_id, Integer, required: false
    argument :cuenta_id, Integer, required: false
    argument :importe, Float, required: false
    argument :tipo_afectacion, String, required: false
    argument :cuenta_contable_categoria_id, Integer, required: false
    argument :cuenta_contable_banco_id, Integer, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end

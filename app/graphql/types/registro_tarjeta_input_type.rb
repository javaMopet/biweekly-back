# frozen_string_literal: true

module Types
  class RegistroTarjetaInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :estado_registro_tarjeta_id, Integer, required: false
    argument :tipo_afectacion, String, required: true
    argument :cuenta_id, Integer, required: false
    argument :categoria_id, Integer, required: false
    argument :importe, Float, required: false
    argument :fecha, GraphQL::Types::ISO8601Date, required: false
    argument :concepto, String, required: false
    argument :is_msi, Boolean, required: false
    argument :numero_msi, Integer, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end

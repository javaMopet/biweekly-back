# frozen_string_literal: true

module Types
  module Categorias
    # Categoria Input
    class CategoriaInputType < Types::BaseInputObject
      argument :id, ID, required: false
      argument :nombre, String, required: false
      argument :icono, String, required: false
      argument :descripcion, String, required: false
      argument :color, String, required: false
      argument :tipo_movimiento_id, Integer, required: false
      argument :cuenta_contable_id, Integer, required: false
      argument :cuenta_id, Integer, required: false
      argument :importe, Float, required: false, default_value: 0.00
      argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
      argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
    end
  end
end

# frozen_string_literal: true

module Types
  module Cuentas
    class CuentaInputType < Types::BaseInputObject
      argument :id, ID, required: false
      argument :nombre, String, required: false
      argument :descripcion, String, required: false
      argument :cuenta_contable_id, Integer, required: false
      argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
      argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
    end
  end
end

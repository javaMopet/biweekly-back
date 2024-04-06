# frozen_string_literal: true

module Types
  module Cuentas
    # Tipo Graphql para Cuenta
    class CuentaInputType < Types::BaseInputObject
      argument :id, ID, required: false
      argument :nombre, String, required: false
      argument :identificador, String, required: false
      argument :cuenta_contable_id, Integer, required: true
      argument :tipo_cuenta_id, Integer, required: true
      argument :dia_corte, Integer, required: false
      argument :propietario, String, required: false
      argument :dias_gracia, Integer, required: true
      argument :banco_id, ID, required: false
      argument :saldo, Float, required: true
      argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
      argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
    end
  end
end

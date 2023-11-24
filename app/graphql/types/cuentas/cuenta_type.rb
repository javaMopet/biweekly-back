# frozen_string_literal: true

module Types
  module Cuentas
    # Tipo graphql para Cuenta
    class CuentaType < Types::BaseObject
      field :id, ID, null: false
      field :nombre, String
      field :identificador, String
      field :cuenta_contable_id, Integer, null: false
      field :cuenta_contable, Types::CuentaContableType
      field :tipo_cuenta, Types::TipoCuentaType, null: false
      field :dia_corte, Integer, null: true
      field :propietario, String, null: true
      field :banco, Types::BancoType, null: true
      field :saldo, Float
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end

# frozen_string_literal: true

module Types
  module Cuentas
    class CuentaType < Types::BaseObject
      field :id, ID, null: false
      field :nombre, String
      field :descripcion, String
      field :cuenta_contable_id, Integer, null: false
      field :cuenta_contable, Types::CuentaContableType
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end

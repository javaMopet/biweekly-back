# frozen_string_literal: true

module Types
  # Tipo cuenta contable
  class CuentaContableType < Types::BaseObject
    field :id, ID, null: false
    field :nombre, String
    field :tipo_afectacion, String
    field :subnivel, Integer
    field :padre_id, Integer
    field :padre, CuentaContableType, null: true
    field :nombre_completo, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end

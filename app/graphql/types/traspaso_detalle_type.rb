# frozen_string_literal: true

module Types
  class TraspasoDetalleType < Types::BaseObject
    field :id, ID, null: false
    field :traspaso_id, Integer, null: false
    field :traspaso, Types::TraspasoType, null: false
    field :cuenta_id, Integer, null: false
    field :cuenta, Types::Cuentas::CuentaType, null: false
    field :tipo_cuenta_traspaso_id, Integer
    field :importe, Float
    field :registro, Types::RegistroType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end

# frozen_string_literal: true

module Types
  class DetalleMovimientoType < Types::BaseObject
    field :id, ID, null: false
    field :movimiento_id, Integer, null: false
    field :movimiento, Types::MovimientoType, null: false
    field :categoria_id, Integer, null: true
    field :categoria, Types::Categorias::CategoriaType, null: true
    field :cuenta_id, Integer, null: true
    field :cuenta, Types::Cuentas::CuentaType, null: true
    field :importe, Float
    field :tipo_afectacion, String
    field :tipo_detalle, String
    # field :cuenta_contable_id, Integer, null: false
    field :cuenta_contable, Types::CuentaContableType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end

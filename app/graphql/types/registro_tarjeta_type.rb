# frozen_string_literal: true

module Types
  class RegistroTarjetaType < Types::BaseObject
    field :id, ID, null: false
    field :estado_registro_tarjeta_id, Integer, null: false
    field :cuenta_id, Integer, null: false
    field :categoria_id, Integer, null: false
    field :estado_registro_tarjeta, Types::EstadoRegistroTarjetaType, null: false
    field :cuenta, Types::Cuentas::CuentaType, null: false
    field :categoria, Types::Categorias::CategoriaType, null: false
    field :importe, Float
    field :fecha, GraphQL::Types::ISO8601Date
    field :concepto, String
    field :is_msi, Boolean, null: false
    field :numero_msi, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
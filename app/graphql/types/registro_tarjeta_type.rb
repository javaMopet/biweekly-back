# frozen_string_literal: true

module Types
  class RegistroTarjetaType < Types::BaseObject
    field :id, ID, null: false
    field :estado_registro_tarjeta_id, Integer, null: false
    field :estado_registro_tarjeta, Types::EstadoRegistroTarjetaType, null: false
    field :tipo_afectacion, String, null: false
    field :cuenta_id, Integer, null: false
    field :categoria_id, Integer, null: true
    field :cuenta, Types::Cuentas::CuentaType, null: false
    field :categoria, Types::Categorias::CategoriaType, null: true
    field :importe, Float
    field :fecha, GraphQL::Types::ISO8601Date
    field :concepto, String
    field :is_msi, Boolean, null: false
    field :cargo, Float, null: true
    field :abono, Float, null: true
    field :importe_mensual, Float, null: false
    field :pago_tarjeta_id, ID, null: true
    field :is_pago, Boolean, null: true
    field :numero_msi, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end

# frozen_string_literal: true

module Types
  # Graphql type para Registro
  class RegistroType < Types::BaseObject
    field :id, ID, null: false
    field :estado_registro_id, Integer, null: false
    field :tipo_afectacion, String, null: false
    field :importe, Float
    field :importe_string, String, null: true
    field :fecha, GraphQL::Types::ISO8601Date
    field :observaciones, String
    field :nombre_completo, String
    field :cuenta_id, Integer, null: false
    field :cargo, Float, null: true
    field :abono, Float, null: true
    field :categoria, Types::Categorias::CategoriaType, null: true
    field :cuenta, Types::Cuentas::CuentaType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def importe_string
      object.importe.to_s
    end
  end
end

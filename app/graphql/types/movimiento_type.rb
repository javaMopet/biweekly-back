# frozen_string_literal: true

module Types
  # Definición del tipo movimiento
  class MovimientoType < Types::BaseObject
    field :id, ID, null: false
    field :numero, Integer
    field :estado_movimiento_id, Integer, null: false
    field :estado_movimiento, Types::EstadoMovimientoType, null: false
    field :tipo_movimiento_id, Integer, null: false
    field :tipo_movimiento, Types::TipoMovimientoType, null: false
    field :fecha, GraphQL::Types::ISO8601Date
    field :observaciones, String
    field :user_id, Integer, null: false
    # field :user, Types::UserType, null: false
    field :detalles_movimiento, [Types::DetalleMovimientoType]
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end

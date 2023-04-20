# frozen_string_literal: true

module Types
  class RegistroType < Types::BaseObject
    field :id, ID, null: false
    field :estado_registro_id, Integer, null: false
    field :registrable_type, String
    field :registrable_id, Integer
    field :importe, Float
    field :fecha, GraphQL::Types::ISO8601Date
    field :nombre_completo, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end

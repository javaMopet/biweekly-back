# frozen_string_literal: true

module Types
  class IngresoType < Types::BaseObject
    field :id, ID, null: false
    field :categoria_id, Integer, null: false
    field :registro, Types::RegistroType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end

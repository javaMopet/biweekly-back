# frozen_string_literal: true

module Types
  class BancoType < Types::BaseObject
    field :id, ID, null: false
    field :nombre, String
    field :icono, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end

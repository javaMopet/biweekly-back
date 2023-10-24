# frozen_string_literal: true

module Types
  class TraspasoType < Types::BaseObject
    field :id, ID, null: false
    field :fecha, GraphQL::Types::ISO8601Date
    field :observaciones, String
    field :user_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end

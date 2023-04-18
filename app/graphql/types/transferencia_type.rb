# frozen_string_literal: true

module Types
  class TransferenciaType < Types::BaseObject
    field :id, ID, null: false
    field :cuenta_origen_id, Integer, null: false
    field :cuenta_destino_id, Integer, null: false
    field :observaciones, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end

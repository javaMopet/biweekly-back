# frozen_string_literal: true

module Types
  class TransferenciaType < Types::BaseObject
    field :id, ID, null: false
    # agregar el tipo de cuenta origen o destino
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end

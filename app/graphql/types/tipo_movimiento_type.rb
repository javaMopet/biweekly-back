# frozen_string_literal: true

module Types
  class TipoMovimientoType < Types::BaseObject
    field :id, ID, null: false
    field :nombre, String
    field :label, String
    field :value, ID, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def value
      object.id
    end

    def label
      object.nombre.to_s
    end
  end
end

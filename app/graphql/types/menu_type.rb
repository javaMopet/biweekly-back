# frozen_string_literal: true

module Types
  class MenuType < Types::BaseObject
    field :id, ID, null: false
    field :nombre, String
    field :icono, String
    field :ruta, String
    field :padre, Integer
    field :tiene_hijos, Boolean
    field :orden, Integer
    field :activo, Boolean
    field :ruta_vista, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end

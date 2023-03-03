# frozen_string_literal: true

module Types
  module Categorias
    class CategoriaType < Types::BaseObject
      field :id, ID, null: false
      field :nombre, String
      field :icono, String
      field :descripcion, String
      field :color, String
      field :tipo_categoria_id, Integer, null: false
      field :cuenta_contable_id, Integer, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end

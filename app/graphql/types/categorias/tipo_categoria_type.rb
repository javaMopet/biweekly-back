# frozen_string_literal: true

module Types
  module Categorias
    class TipoCategoriaType < Types::BaseObject
      field :id, ID, null: false
      field :nombre, String
      field :tipo_afectacion, String
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end

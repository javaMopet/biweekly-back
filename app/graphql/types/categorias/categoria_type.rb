# frozen_string_literal: true

module Types
  module Categorias
    class CategoriaType < Types::BaseObject
      field :id, ID, null: false
      field :nombre, String
      field :icono, String
      field :descripcion, String
      field :color, String
      field :tipo_categoria, Types::Categorias::TipoCategoriaType, null: false
      field :cuenta_contable, Types::CuentaContableType, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end

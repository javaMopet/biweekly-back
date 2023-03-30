# frozen_string_literal: true

module Types
  module Categorias
    # Tipo de Categoria
    class TipoCategoriaType < Types::BaseObject
      field :id, ID, null: false
      field :nombre, String
      field :tipo_afectacion, String
      field :label, String
      field :value, ID, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

      def label
        object.nombre.to_s
      end
      def value
        object.id
      end 
    end
  end
end

# frozen_string_literal: true

module Types
  module Categorias
    # Categoria
    class CategoriaType < Types::BaseObject
      field :id, ID, null: false
      field :nombre, String
      field :icono, String
      field :descripcion, String
      field :color, String
      field :tipo_movimiento_id, ID, null: false
      field :tipo_movimiento, Types::TipoMovimientoType, null: false
      field :cuenta_contable, Types::CuentaContableType, null: true
      field :cuenta_default, Types::Cuentas::CuentaType, null: true
      field :importe_default, Float, null: true
      field :user, Types::UserType, null: false
      field :instance_id, ID, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end

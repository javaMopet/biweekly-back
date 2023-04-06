# frozen_string_literal: true

module Types
  # Tipo graphql para el Tipo de Cuenta
  class TipoCuentaType < Types::BaseObject
    field :id, ID, null: false
    field :nombre, String
    field :label, String
    field :value, ID
    field :icon, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def label
      object.nombre.to_s
    end

    def value
      object.id
    end

    def icon
      object.icono.to_s
    end
  end
end

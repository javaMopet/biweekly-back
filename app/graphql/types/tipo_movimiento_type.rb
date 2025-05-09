# frozen_string_literal: true

module Types
  # Tipo de movimiento
  class TipoMovimientoType < Types::BaseObject
    field :id, ID, null: false
    field :nombre, String
    field :label, String
    field :value, ID, null: false
    field :icono, String, null: true
    field :icon, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    # Obtener un value.
    def value
      object.id
    end

    # Obtener un label.
    def label
      object.nombre.to_s
    end

    # Obtener un icon.
    def icon 
      object.icono.to_s
    end 
  end
end

# frozen_string_literal: true

module Types
  class InstanceType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :logo_image, String, null: false
    field :dominio, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end

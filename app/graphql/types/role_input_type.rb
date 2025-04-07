# frozen_string_literal: true

module Types
  class RoleInputType < Types::BaseInputObject
    argument :id, ID, required: true
    argument :name, String, required: true
    argument :resource_type, String, required: false
    argument :resource_id, Integer, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end

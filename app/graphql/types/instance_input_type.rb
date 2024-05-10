# frozen_string_literal: true

module Types
  class InstanceInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :name, String, required: false
    argument :logo_image, String, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end

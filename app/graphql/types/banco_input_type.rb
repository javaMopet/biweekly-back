# frozen_string_literal: true

module Types
  class BancoInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :nombre, String, required: false
    argument :icono, String, required: false
    argument :instance_id, ID, required: true
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end

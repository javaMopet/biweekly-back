# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :name, String, null: true
    field :encrypted_password, String, null: false
    field :reset_password_token, String
    field :reset_password_sent_at, GraphQL::Types::ISO8601DateTime
    field :instance, Types::InstanceType, null: false
    field :can_modify, Boolean, null: false
    field :is_admin, Boolean, null: false
    field :roles, [String], null: true
    field :menus, [Types::MenuType], null: true
    field :remember_created_at, GraphQL::Types::ISO8601DateTime
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    # El usuario puede modificar
    def can_modify
      object.has_any_role? :admin, :manager
    end

    # El usuario es administrador
    def is_admin
      object.has_role? :admin
    end

    # Get roles from user
    def roles
      object.roles.distinct.where.not(name: :menuRole).pluck(:name)
    end
  end
end

# frozen_string_literal: true

module Mutations
  module Admin
    class UserUpdate < BaseMutation
      description "Updates a user by id"

      field :user, Types::UserType, null: false

      argument :id, ID, required: true
      argument :user_input, Types::UserInputType, required: true
      argument :instances, [ID], required: false
      argument :roles, [ID], required: false

      # Main method
      def resolve(id:, user_input:, instances: [], roles: [])
        user = ::User.find(id)

        p instances

        user.instances = Instance.where(id: instances) if instances.present?

        if roles
          # Elimina roles anteriores
          user.roles.destroy_all
          Role.where(id: roles).pluck(:name).each do |role_name|
            user.add_role(role_name.to_sym)
          end
        end

        unless user.update(**user_input)
          raise GraphQL::ExecutionError.new "Error updating user", extensions: user.errors.to_hash
        end

        { user: }
      end
    end
  end
end

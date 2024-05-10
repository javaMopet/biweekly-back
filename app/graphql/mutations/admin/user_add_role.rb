# frozen_string_literal: true

module Mutations
  module Admin
    class UserAddRole < BaseMutation
      description "Updates the role from a user by id"

      field :user, Types::UserType, null: false

      argument :user_id, ID, required: true
      argument :role, String, required: true

      # main resolver
      def resolve(user_id:, role:)
        user = ::User.find(user_id)

        user.add_role role
        { user: }
      end
    end
  end
end

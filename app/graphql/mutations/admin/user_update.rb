# frozen_string_literal: true

module Mutations
  module Admin
    class UserUpdate < BaseMutation
      description "Updates a user by id"

      field :user, Types::UserType, null: false

      argument :id, ID, required: true
      argument :user_input, Types::UserInputType, required: true

      # Main method
      def resolve(id:, user_input:)
        user = ::User.find(id)
        unless user.update(**user_input)
          raise GraphQL::ExecutionError.new "Error updating user", extensions: user.errors.to_hash
        end

        { user: }
      end
    end
  end
end

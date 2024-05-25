# frozen_string_literal: true

module Mutations
  class UserDelete < BaseMutation
    description "Deletes a user by ID"

    field :user, Types::UserType, null: false

    argument :id, ID, required: true

    # main method
    def resolve(id:)
      user = ::User.find(id)

      authorize!(:destroy, user)

      raise GraphQL::ExecutionError.new "Error deleting user", extensions: user.errors.to_hash unless user.destroy

      { user: }
    end
  end
end

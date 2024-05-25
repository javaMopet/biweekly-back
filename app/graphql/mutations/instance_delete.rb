# frozen_string_literal: true

module Mutations
  class InstanceDelete < BaseMutation
    description "Deletes a instance by ID"

    field :instance, Types::InstanceType, null: false

    argument :id, ID, required: true

    # main function
    def resolve(id:)
      instanz = ::Instance.find(id)

      authorize!(:destroy, instanz)

      unless instanz.destroy
        raise GraphQL::ExecutionError.new "Error deleting instance", extensions: instanz.errors.to_hash
      end

      { instance: instanz }
    end
  end
end

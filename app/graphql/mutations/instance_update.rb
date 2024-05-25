# frozen_string_literal: true

module Mutations
  class InstanceUpdate < BaseMutation
    description "Updates a instance by id"

    field :instance, Types::InstanceType, null: false

    argument :id, ID, required: true
    argument :instance_input, Types::InstanceInputType, required: true

    # main method
    def resolve(id:, instance_input:)
      instanz = ::Instance.find(id)

      authorize!(:update, instanz)

      unless instanz.update(**instance_input)
        raise GraphQL::ExecutionError.new "Error updating instance", extensions: instanz.errors.to_hash
      end

      { instance: instanz }
    end
  end
end

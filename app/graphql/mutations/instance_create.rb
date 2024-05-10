# frozen_string_literal: true

module Mutations
  class InstanceCreate < BaseMutation
    description "Creates a new instance"

    field :instance, Types::InstanceType, null: false

    argument :instance_input, Types::InstanceInputType, required: true

    # main menu
    def resolve(instance_input:)
      instanz = ::Instance.new(**instance_input)
      unless instanz.save
        raise GraphQL::ExecutionError.new "Error creating instance", extensions: instanz.errors.to_hash
      end

      { instance: instanz }
    end
  end
end

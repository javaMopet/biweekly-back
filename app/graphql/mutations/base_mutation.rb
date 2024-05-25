# frozen_string_literal: true

module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    #     class BaseMutation < GraphQL::Schema::RelayClassicMutation
    # Helper para la autorizacion cancancan abilities
    include AuthorizationHelper

    argument_class Types::BaseArgument
    field_class Types::BaseField
    # input_object_class Types::BaseInputObject
    object_class Types::BaseObject
    #     end

    # Get current user from graphql_devise
    def current_user
      context[:current_resource]
    end
  end
end

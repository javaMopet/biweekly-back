# frozen_string_literal: true

module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    #     class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Types::BaseArgument
    field_class Types::BaseField
    # input_object_class Types::BaseInputObject
    object_class Types::BaseObject
    #     end
    # class BaseMutation < GraphQL::Schema::Mutation
    #   null false

    # Get current user from graphql_devise
    def current_user
      context[:current_resource]
    end

    # Get abilities from current user
    def current_abilities
      p "getting abilities"
      Ability.new(current_user)
    end

    # Simplify method can?
    def can?(action, subject)
      current_abilities.can? action, subject
    end
  end
end

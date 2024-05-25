# app/graphql/mutations/authorization_helper.rb
module Mutations
  module AuthorizationHelper
    # validar si el current_user tiene la habilidad de ejecutar la action
    def authorize!(action, subject)
      ability = Ability.new(current_user)

      return if ability.can?(action, subject)

      raise GraphQL::ExecutionError, "You do not have permission to #{action} #{subject.class.name.downcase}."
    end
  end
end

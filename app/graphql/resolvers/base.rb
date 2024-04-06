# frozen_string_literal: true

module Resolvers
  class Base < GraphQL::Schema::Resolver
    # if you have a custom argument class, you can attach it:

    # Get current user from graphql_devise
    # def current_user
    #   context[:current_resource]
    # end
  end
end

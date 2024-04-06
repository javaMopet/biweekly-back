module Types
  class BaseObject < GraphQL::Schema::Object
    edge_type_class(Types::BaseEdge)
    connection_type_class(Types::BaseConnection)
    field_class Types::BaseField

    # Get current user from graphql_devise
    # def current_user
    #   context[:current_resource]
    # end
  end
end

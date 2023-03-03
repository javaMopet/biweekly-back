# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :menu_levels, resolver: Resolvers::MenuLevels, description: 'Arbol de menús'

    field :users_list, resolver: Resolvers::Users::UsersList, description: 'Obtener lista de usuarios'

    field :lista_categorias, resolver: Resolvers::Categorias::ListaCategorias, 
    description: 'Obtener lista de categorias'

    field :lista_tipos_categoria, resolver: Resolvers::Categorias::ListaTiposCategoria,
    description: 'Obtener lista de tipos de categoria'

    field :lista_cuentas, resolver: Resolvers::Cuentas::ListaCuentas,
    description: 'Obtener lista de cuentas'

    field :lista_cuentas_contables, resolver: Resolvers::ListaCuentasContables,
    description: 'Obtener lista de cuentas contables'
  end
end

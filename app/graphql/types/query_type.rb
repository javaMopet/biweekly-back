# frozen_string_literal: true

module Types
  # Queries
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :menu_levels, resolver: Resolvers::MenuLevels, description: 'Arbol de menús'

    field :users_list, resolver: Resolvers::Users::UsersList,
                       description: 'Obtener lista de usuarios'

    field :lista_categorias, resolver: Resolvers::Categorias::ListaCategorias,
                             description: 'Obtener lista de categorias'

    field :lista_tipos_movimiento, resolver: Resolvers::Movimientos::ListaTiposMovimiento,
                                   description: 'Obtener lista de tipos de movimientos'

    field :lista_tipos_cuenta,
          resolver: Resolvers::Cuentas::ListaTiposCuenta,
          description: 'Obtener lista de tipos de tipos de cuenta'

    field :lista_cuentas, resolver: Resolvers::Cuentas::ListaCuentas,
                          description: 'Obtener lista de cuentas'

    field :lista_cuentas_contables, resolver: Resolvers::ListaCuentasContables,
                                    description: 'Obtener lista de cuentas contables'

    field :arbol_cuentas_contables, resolver: Resolvers::CuentasContables::ArbolCuentasContables,
                                    description: 'Obtener arbol de cuentas contables'

    field :lista_movimientos, resolver: Resolvers::Movimientos::ListaMovimientos,
                              description: 'Obtener lista de movimientos'
    field :lista_detalles_movimiento, resolver: Resolvers::Movimientos::ListaDetallesMovimiento,
                                      description: 'Obtener lista de detalles de movimientos'
    field :obtener_registros, resolver: Resolvers::Registros::ObtenerRegistros,
                              description: 'Obtener lista de registros de movimientos'
    field :obtener_ingresos, resolver: Resolvers::Registros::ObtenerIngresos,
                             description: 'Obtener lista de registros de movimientos de ingreso'
    field :obtener_egresos, resolver: Resolvers::Registros::ObtenerEgresos,
                            description: 'Obtener lista de registros de movimientos de egreso'
  end
end

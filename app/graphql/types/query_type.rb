# frozen_string_literal: true

module Types
  # Queries
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    #     include GraphQL::Types::Relay::HasNodeField
    #     include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :role_list, resolver: Resolvers::Admin::RoleList, description: 'Lista de roles', authenticate: true
    field :instance_list,
          resolver: Resolvers::Admin::InstanceList,
          description: 'Lista de instancias',
          authenticate: true
    field :menu_levels, resolver: Resolvers::MenuLevels, description: 'Arbol de menús'
    field :menus_list, resolver: Resolvers::Menus::MenusList, description: 'Lista de menús'

    field :users_list,
          resolver: Resolvers::Users::UsersList,
          description: 'Obtener lista de usuarios',
          authenticate: true

    field :lista_categorias,
          resolver: Resolvers::Categorias::ListaCategorias,
          description: 'Obtener lista de categorias'

    field :categoria_by_id, resolver: Resolvers::Categorias::CategoriaById, description: 'Obtener una categoria por id'

    field :lista_tipos_movimiento,
          resolver: Resolvers::Movimientos::ListaTiposMovimiento,
          description: 'Obtener lista de tipos de movimientos'

    field :lista_tipos_cuenta,
          resolver: Resolvers::Cuentas::ListaTiposCuenta,
          description: 'Obtener lista de tipos de tipos de cuenta'

    field :lista_cuentas, resolver: Resolvers::Cuentas::ListaCuentas, description: 'Obtener lista de cuentas'
    field :cuenta_by_id, resolver: Resolvers::Cuentas::CuentaById, description: 'Obtener una cuenta por id'

    field :lista_cuentas_contables,
          resolver: Resolvers::ListaCuentasContables,
          description: 'Obtener lista de cuentas contables'

    field :arbol_cuentas_contables,
          resolver: Resolvers::CuentasContables::ArbolCuentasContables,
          description: 'Obtener arbol de cuentas contables'

    field :obtener_registros,
          resolver: Resolvers::Registros::ObtenerRegistros,
          description: 'Obtener lista de registros de movimientos'
    field :obtener_saldo_a_fecha,
          resolver: Resolvers::Cuentas::ObtenerSaldoAFecha,
          description: 'Obtener saldo a una fecha dada'
    # field :obtener_egresos, resolver: Resolvers::Registros::ObtenerEgresos,
    #                         description: 'Obtener lista de registros de movimientos de egreso'

    field :lista_registros_tarjeta,
          resolver: Resolvers::RegistrosTarjeta::ListaRegistrosTarjeta,
          description: 'Obtener lista de registros de una tarjeta de crédito'
    field :lista_bancos, resolver: Resolvers::Bancos::ListaBancos, description: 'Obtener lista de bancos'

    field :saldo_tarjeta_credito,
          resolver: Resolvers::TarjetasCredito::SaldoTarjetaCredito,
          description: 'Obtener el saldo de la tarjeta de credito'

    field :saldo_pagar_tarjeta_credito,
          resolver: Resolvers::TarjetasCredito::SaldoPagarTarjetaCredito,
          description: 'Obtener el saldo a pagar (p no generar interes) de la tarjeta de credito'

    field :lista_traspasos,
          resolver: Resolvers::Traspasos::ListaTraspasos,
          description: 'Obtener un lista de todos los traspasos'
  end
end

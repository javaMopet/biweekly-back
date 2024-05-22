# frozen_string_literal: true

Rails.application.routes.draw do
  # Para la vista de movimientos
  get '/movimientos/columnas'
  get '/movimientos/ingresos_egresos'
  get '/movimientos/saldos_cuentas'
  get '/movimientos/saldos_ingresos_egresos'
  get '/movimientos/saldos_finales'

  # Generacion del pago de una tarjeta de credito
  post '/registros_tarjeta/create_pago'

  # Para reportes excel xlsx
  get '/movimientos/to_excel'
  post '/reportes/totales_por_categoria'

  # Graphql end-point
  post '/graphql', to: 'graphql#execute'

  # graphiql for dev environment
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql" if Rails.env.development?

  namespace :stats do
    get 'ingresos_egresos_dataset', to: 'stats#ingresos_egresos_dataset'
    get 'ingresos_dataset', to: 'stats#ingresos_dataset'
    get 'egresos_dataset', to: 'stats#egresos_dataset'
  end

  # Todo lo demas se deja como referencia historica
  # get 'to_excel', to: 'registros#excel_example'
  # mount_graphql_devise_for User, at: 'graphql_auth'
  # resources :tipos_cuenta_traspaso
  # resources :traspaso_detalles
  # resources :traspasos
  # resources :bancos
  # get 'saldo_tarjeta_credito', to: 'registros_tarjeta#saldo_tarjeta_credito'
  # resources :cortes_cuenta
  # resources :inversiones
  # resources :tipos_movimiento
  # get 'to_excel', to: 'tipos_cuenta#show'
  # resources :transferencias
  # resources :egresos
  # resources :ingresos
  # resources :tipos_cuenta
  # devise_for :users,
  #            controllers: {
  #              sessions: 'users/sessions',
  #              registrations: 'users/registrations'
  #            },
  #            defaults: { format: :json }

  # resources :cuentas
  # resources :cuentas_contable
  # resources :categorias
  # get 'pages/home'
  # get 'member-data', to: 'members#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

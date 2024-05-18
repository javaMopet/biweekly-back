# frozen_string_literal: true

Rails.application.routes.draw do
  # only for show 1 element y create pago arriba
  # post '/create_multiple_registros_tarjeta', to: 'registros_tarjeta#create_multiple'
  # post '/registros/create_multiple', to: 'registros#create_multiple'
  post '/registros_tarjeta/create_pago', to: 'registros_tarjeta#create_pago'

  get 'columnas', to: 'registros#columnas'

  get 'movimientos', to: 'registros#movimientos'
  get 'saldos_cuentas', to: 'registros#saldos_cuentas'
  get 'saldos_movimientos', to: 'registros#saldos_movimientos'
  get 'saldos_finales', to: 'registros#saldos_finales'

  resources :registros_tarjeta
  resources :registros

  # Para reportes excel xlsx
  get '/movimientos/to_excel'
  post 'totales_por_categoria', to: 'reportes#totales_por_categoria'
  post '/graphql', to: 'graphql#execute'
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql" if Rails.env.development?

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

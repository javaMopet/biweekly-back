# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tipos_cuenta_traspaso
  resources :traspaso_detalles
  resources :traspasos
  resources :bancos
  post '/create_multiple_registros_tarjeta', to: 'registros_tarjeta#create_multiple'
  post '/registros/create_multiple', to: 'registros#create_multiple'
  post '/registros_tarjeta/create_pago', to: 'registros_tarjeta#create_pago'
  get 'saldo_tarjeta_credito', to: 'registros_tarjeta#saldo_tarjeta_credito'
  resources :registros_tarjeta
  resources :cortes_cuenta
  resources :inversiones
  get 'columnas', to: 'registros#columnas'
  get 'movimientos', to: 'registros#movimientos'
  get 'saldos_cuentas', to: 'registros#saldos_cuentas'
  get 'saldos_movimientos', to: 'registros#saldos_movimientos'
  get 'saldos_finales', to: 'registros#saldos_finales'

  resources :transferencias
  resources :egresos
  resources :ingresos
  resources :registros
  resources :tipos_cuenta
  resources :tipos_movimiento
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             },
             defaults: { format: :json }
  get '/cuentas/obtener_saldo_tarjeta', to: 'cuentas#obtener_saldo_tarjeta'
  resources :cuentas
  resources :cuentas_contable
  resources :categorias
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?

  post '/graphql', to: 'graphql#execute'
  get 'pages/home'

  get 'member-data', to: 'members#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

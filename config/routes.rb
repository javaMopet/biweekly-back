Rails.application.routes.draw do
  resources :tipos_cuenta
  resources :detalles_movimiento
  resources :movimientos
  resources :tipos_movimiento
  resources :estados_movimiento
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }, defaults: { format: :json }
  resources :detalles_registro
  resources :registros
  resources :cuentas
  resources :categorias
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?

  post '/graphql', to: 'graphql#execute'
  get 'pages/home'
  resources :cfdis

  get 'member-data', to: 'members#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

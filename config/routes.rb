Rails.application.routes.draw do
  # Configuración de Devise para usuarios
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    password: 'password',
    confirmation: 'verification',
    unlock: 'unlock',
    registration: 'signup',
    sign_up: 'new'
  }

  # Ruta de inicio (root) del sitio
  root to: "users#index"

  # Rutas para usuarios y grupos
  resources :users, only: [:index]
  resources :groups, only: [:index, :new, :create, :show, :destroy, :update] do
    resources :expenses, only: [:index, :new, :create, :destroy, :update]
  end

  # Rutas para categorías y gastos
  resources :categories, only: [:index, :new, :create] do
    resources :expenses, only: [:index, :new, :create]
  end

  # Ruta independiente para la página de índice de gastos
  resources :expenses, only: [:index]

  # Ruta de bienvenida
  get '/welcome', to: 'welcome#index', as: :welcome

  get '/categories', to: 'categories#index', as: 'categories_index'
  
  devise_scope :user do
    get '/logout', to: 'devise/sessions#destroy'
  end
  
end

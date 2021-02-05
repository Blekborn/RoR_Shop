Rails.application.routes.draw do
  root 'products#index'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :products
  resources :sessions
  resources :categories
  resources :categories, only: [:show] do
    resources :products
  end

  get 'product/search', to: 'products#search', as: 'search'

end

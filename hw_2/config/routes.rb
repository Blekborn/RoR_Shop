Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'products#index'

  resources :orders do
    resources :line_items
  end
  resources :line_items
  resources :carts
  resources :products
  resources :categories
  resources :categories, only: [:show] do
    resources :products
  end

  get 'product/search', to: 'products#search', as: 'search'

end

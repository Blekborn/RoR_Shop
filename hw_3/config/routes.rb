Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'products#index'

  resources :products do
    resources :comments
  end

  resources :categories, only: [:show] do
    resources :products
  end

  resources :line_items, only: :create
  resources :carts
  resources :orders

  get :search, controller: :products

end

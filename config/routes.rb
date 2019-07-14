Rails.application.routes.draw do
  devise_for :users
  get 'products/show'
  root 'products#index'
  resources :products, only: [:index, :show]

  namespace :admin do
    root 'products#index'
    resources :products, only: [:new, :create, :index, :edit, :update, :destroy]
  end

  resource :carts, only: [:show] do
    post ':product_id', to: 'carts#add_item', as: :add_item
    delete ':product_id', to: 'carts#remove_item', as: :remove_item
  end
end

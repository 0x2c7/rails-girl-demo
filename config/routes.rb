Rails.application.routes.draw do
  get 'products/show'
  root 'products#index'
  resources :products, only: [:index, :show]
end

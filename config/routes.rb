Rails.application.routes.draw do
  root to: 'cart#index'
  resources :cart, only: [:index]
end

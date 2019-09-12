Rails.application.routes.draw do
  resources :cart_plants, only: [:index, :create, :destroy, :show]
  resources :carts, only: [:index, :create, :show, :destroy]
  resources :plants, only: [:index, :show]
  resources :users, only: [:index, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

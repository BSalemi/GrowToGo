Rails.application.routes.draw do
  resources :cart_plants, only: [:index, :create, :delete]
  resources :carts, only: [:create, :show, :delete]
  resources :plants, only: [:index, :show]
  resources :users, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :cart_plants, only: [:index, :create, :destroy, :show]
  resources :carts, only: [:index, :show]
  resources :plants, only: [:index, :show]
  resources :users, only: [:create, :show]

  post '/checkout' => 'carts#checkout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

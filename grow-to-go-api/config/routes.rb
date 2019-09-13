Rails.application.routes.draw do
  resources :cart_plants, only: [:index, :create, :destroy, :show]
  resources :carts, only: [:index, :show]
  resources :plants, only: [:index, :show]
  resources :users, only: [:create, :show]

  post '/checkout' => 'carts#checkout'
  
  get '/sorted_price' => 'plants#sorted_price'
  get '/find_mini' => 'plants#find_mini'
  get '/find_small' => 'plants#find_small'
  get '/find_medium' => 'plants#find_medium'
  get '/find_large' => 'plants#find_large'
  get '/find_xlarge' => 'plants#find_xlarge'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

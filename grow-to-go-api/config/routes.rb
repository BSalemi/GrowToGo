Rails.application.routes.draw do
  resources :cart_plants, only: [:index, :create, :destroy, :show]
  resources :carts, only: [:index, :show]
  resources :plants, only: [:index, :show]
  resources :users, only: [:create, :show]

  post '/checkout' => 'carts#checkout'

  get '/sort_price_asc' => 'plants#sort_price_asc'
  get '/sort_price_desc'=> 'plants#sort_price_desc'
  get '/find_mini' => 'plants#find_mini'
  get '/find_small' => 'plants#find_small'
  get '/find_medium' => 'plants#find_medium'
  get '/find_large' => 'plants#find_large'
  get '/find_xlarge' => 'plants#find_xlarge'
  get '/find_beginner' => 'plants#find_beginner'
  get '/find_intermediate' => 'plants#find_intermediate'
  get '/find_advanced' => 'plants#find_advanced'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

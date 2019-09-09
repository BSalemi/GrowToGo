class CartPlantsController < ApplicationController

    def index
        cart_plants = Cart_Plants.all 
        render json: cart_plants, except: [:created_at, :updated_at]
    end 

   
end

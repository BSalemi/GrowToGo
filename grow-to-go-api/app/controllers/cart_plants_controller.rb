class CartPlantsController < ApplicationController

    def index
        cart_plants = CartPlant.all 
        render json: cart_plants, except: [:created_at, :updated_at]
    end 

    def create 
        cart_plant = CartPlant.create(cart_plant_params)
        render json: cart_plant, except: [:created_at, :updated_at]
    end 
   

    private
    
    def cart_plant_params
        params.require(:cart_plant).permit(:cart_id, :plant_id)
    end 
end

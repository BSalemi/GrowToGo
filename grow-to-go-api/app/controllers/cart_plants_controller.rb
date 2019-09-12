class CartPlantsController < ApplicationController

    def index
        cart_plants = CartPlant.all 
        
        render json: cart_plants, except: [:created_at, :updated_at]
    end 

    def create 
        cart_plant = CartPlant.create(cart_plant_params)
        cart = Cart.find(cart_plant_params[:cart_id])
        user = cart.user
        
        render json: user, :include => {
            carts: {
                except: [:created_at, :updated_at], 
                methods: :total, 
                include: {
                    cart_plants:{ 
                        include: :plant
                    }},
            }}, except: [:created_at, :updated_at]
    end 
   
    def destroy 
        cart_plant = CartPlant.find(params[:id])
        user = cart_plant.cart.user
        cart_plant.destroy
        
        render json: user, :include => {
            carts: {
                except: [:created_at, :updated_at], 
                methods: :total, 
                include: {
                    cart_plants:{ 
                        include: :plant
                    }},
            }}, except: [:created_at, :updated_at]
    end 

    private
    
    def cart_plant_params
        params.require(:cart_plant).permit(:cart_id, :plant_id)
    end 
end

class CartsController < ApplicationController

    def index 
        carts = Cart.all 
        
        render json: carts, :except => [:created_at, :updated_at]
        render json: carts(:include => {
            :user => {:only => [:name]},
        }), :except => [:created_at, :updated_at]
    end 

    def show 
        cart = Cart.find_by(id: params[:id])
        if cart 
           
            render json: cart(:include => {
                user: {:only => [:name]},
            }), except: [:created_at, :updated_at]
        else
            render json: {message: "Cart not found."}
        end 
    end 
end

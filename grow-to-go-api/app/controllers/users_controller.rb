class UsersController < ApplicationController

    def index 
        users = Users.all 
        render json: users, except: [:created_at, :updated_at]
    end 

    def show 
        user = User.find_by(id: params[:id])
        if user 
            render json: user(:include => {
                cart: {except: [:created_at, :updated_at]}
            }, except: [:created_at, :updated_at])
        else 
            render json: {message: "User not found."}
        end 
    end 

    def create 
        user = User.create(user_params)
        cart = Cart.create(user_id: user.id)
        render json: user.to_json(:include => {
            :carts => {:except => [:created_at, :updated_at]},
        },  :except => [:created_at, :updated_at])
    end 


    private 

    def user_params
        params.require(:user).permit(:name, :email)
    end 
end

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
        byebug
    end 
end

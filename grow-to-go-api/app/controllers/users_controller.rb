class UsersController < ApplicationController


    def show 
        user = User.find_by(id: params[:id])
        if user 
            
            render json: user, :include => {
                carts: {
                    except: [:created_at, :updated_at], 
                    methods: :total, 
                    include: {
                        cart_plants:{ 
                            include: :plant
                        }},
                },
                }, except: [:created_at, :updated_at]
        else 
            render json: {message: "User not found."}
        end 
    end 

    def create 
        user = User.find_or_create_by(email: params[:email]) 
        user.name = params[:name]
        user.save
        cart = Cart.create(user_id: user.id) if user.carts.length == 0
        user.carts << cart 
        
        render json: user, :include => {
                carts: {
                    except: [:created_at, :updated_at], 
                    methods: :total, 
                    include: {
                        cart_plants:{ 
                            include: :plant
                        }},
                },
                }, except: [:created_at, :updated_at]
    end 


    private 

    def user_params
        params.require(:user).permit(:name, :email)
    end 
end

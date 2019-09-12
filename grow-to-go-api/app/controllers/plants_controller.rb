class PlantsController < ApplicationController

    def index 
        plants = Plant.all 
        
        render json: plants, except: [:created_at, :updated_at]
    end 

    def show
        plant = Plant.find_by(id: params[:id])
        if plant 
            render json: plants, except: [:created_at, :updated_at]
        else 
            render json: {message: "Plant not found."}
        end 
    end 

    
end

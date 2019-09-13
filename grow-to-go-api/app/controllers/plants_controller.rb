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

    def sorted_price
        sorted = Plant.all.sort_by{|plant| plant.price }
        render json: sorted
    end 

    def find_mini
        mini = Plant.all.select{|plant| plant.size.downcase == "mini"}
        render json: mini
    end 

    def find_small
        small = Plant.all.select{|plant| plant.size.downcase == "small"}
        render json: small
    end

    def find_medium
        medium = Plant.all.select{|plant| plant.size.downcase == "medium"}
        render json: medium
    end 

    def find_large
        large = Plant.all.select{|plant| plant.size.downcase == "large"}
        render json: large
    end 

    def find_xlarge
        xlarge = Plant.all.select{|plant| plant.size == "X-Large"}
        render json: xlarge
    end 

end

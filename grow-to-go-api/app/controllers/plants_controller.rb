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

    def sort_price_asc
        sorted = Plant.all.sort_by{|plant| plant.price }
        render json: sorted
    end 

    def sort_price_desc
        sorted = Plant.all.sort_by{|plant| plant.price}.reverse
        render json: sorted
    end 

    def find_mini
        mini = Plant.all.select{|plant| plant.size == "Mini"}
        render json: mini
    end 

    def find_small
        small = Plant.all.select{|plant| plant.size == "Small"}
        render json: small
    end

    def find_medium
        medium = Plant.all.select{|plant| plant.size == "Medium"}
        render json: medium
    end 

    def find_large
        large = Plant.all.select{|plant| plant.size == "Large"}
        render json: large
    end 

    def find_xlarge
        xlarge = Plant.all.select{|plant| plant.size == "X-Large"}
        render json: xlarge
    end 

    def find_beginner 
        beginner = Plant.all.select{|plant| plant.exp_level == "Beginner"}
        render json: beginner
    end 

    def find_intermediate
        intermediate = Plant.all.select{|plant| plant.exp_level == "Intermediate"}
        render json: intermediate
    end 

    def find_advanced
        advanced = Plant.all.select{|plant| plant.exp_level == "Advanced"}
        render json: advanced
    end 

    def find_low
        low = Plant.all.select{|plant| plant.light_required.include? "Low"}
        render json: low    
    end 

    def find_medium_indirect
        medium = Plant.all.select{|plant| plant.light_required.include? "Medium"}
        render json: medium 
    end 

    def find_bright_indirect
        bright_indirect = Plant.all.select{|plant| plant.light_required.include? "Bright Indirect"}
        render json: bright_indirect 
    end 

    def find_bright_direct 
        bright_direct = Plant.all.select{|plant| plant.light_required.include? "Bright Direct"}
        render json: bright_direct 
    end 

    def find_full_sun 
        full_sun = Plant.all.select{|plant| plant.light_required.include? "Full Sun"}
        render json: full_sun 
    end 

end

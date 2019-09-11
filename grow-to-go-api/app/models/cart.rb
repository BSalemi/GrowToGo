class Cart < ApplicationRecord
    belongs_to :user 
    has_many :cart_plants 
    has_many :plants, through: :cart_plants

    def total 
        #self.plants.reduce do |0, plant.price| 

        sum = 0
        self.plants.each do |plant|
            sum += plant.price
        end 
        sum
    end
end

class Plant < ApplicationRecord
    has_many :cart_plants
    has_many :carts, through: :cart_plants
end

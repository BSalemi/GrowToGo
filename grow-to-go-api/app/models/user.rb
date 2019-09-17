class User < ApplicationRecord
    has_many :carts
    has_many :cart_plants
    has_many :plants, through: :cart_plants

end

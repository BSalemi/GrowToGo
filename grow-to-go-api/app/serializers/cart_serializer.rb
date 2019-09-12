class CartSerializer
  include FastJsonapi::ObjectSerializer
  attributes :checkout
  belongs_to :user 
  has_many :cart_plants 
  has_many :plants, through: :cart_plants
end

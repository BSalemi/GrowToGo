class PlantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :species, :price, :exp_level, :light_required, :size, :image
  has_many :cart_plants
  has_many :carts, through: :cart_plants

end

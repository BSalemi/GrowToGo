class CartPlantSerializer
  include FastJsonapi::ObjectSerializer
  attributes 
  belongs_to :cart
  belongs_to :plant
end

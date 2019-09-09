class AddDefaultValueToCheckout < ActiveRecord::Migration[5.2]
  def up
    change_column_default :carts, :checkout, false
end

def down
    change_column_default :carts, :checkout, nil
end
end

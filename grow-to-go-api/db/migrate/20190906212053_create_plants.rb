class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :species
      t.integer :price
      t.string :exp_level
      t.string :size
      t.string :light_required
      t.string :image

      t.timestamps
    end
  end
end

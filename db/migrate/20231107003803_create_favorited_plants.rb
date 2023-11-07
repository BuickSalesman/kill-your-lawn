class CreateFavoritedPlants < ActiveRecord::Migration[7.0]
  def change
    create_table :favorited_plants do |t|
      t.integer :user_id
      t.integer :plant_api_id
      t.string :image_url
      t.string :scientific_name

      t.timestamps
    end
  end
end

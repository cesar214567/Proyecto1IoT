class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :description
      t.float :latitude
      t.float :longitude
      t.string :loc
      t.references :user, null: false
      t.timestamps
    end
  end
end

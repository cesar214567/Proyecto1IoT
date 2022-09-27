class CreateDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :description
      t.float :cost
      t.references :restaurant, null: false
      t.timestamps
    end
  end
end

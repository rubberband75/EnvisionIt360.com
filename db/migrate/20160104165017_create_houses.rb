class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      
      t.string :name
      t.text :address
      t.string :image
      t.string :status

      t.timestamps null: false
    end
  end
end

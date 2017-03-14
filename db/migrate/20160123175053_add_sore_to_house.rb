class AddSoreToHouse < ActiveRecord::Migration
  def change
    add_column :houses, :score, :integer
  end
end

class AddFileToHouse < ActiveRecord::Migration
  def change
    add_column :houses, :file, :string
  end
end

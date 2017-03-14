class AddMetaToHouse < ActiveRecord::Migration
  def change
    add_column :houses, :meta, :string
  end
end

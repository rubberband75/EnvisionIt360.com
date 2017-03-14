class AddLoginCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :loginCount, :int
  end
end

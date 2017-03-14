class AddFileToOptions < ActiveRecord::Migration
  def change
    add_column :options, :file, :string
  end
end

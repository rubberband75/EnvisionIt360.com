class AddCategoryToOptions < ActiveRecord::Migration
  def change
    add_column :options, :category, :string
  end
end

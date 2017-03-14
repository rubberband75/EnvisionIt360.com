class CreateOptionLinks < ActiveRecord::Migration
  def change
    create_table :option_links do |t|
      t.belongs_to :house, index: true
      t.belongs_to :option, index: true

      t.timestamps null: false
    end
  end
end

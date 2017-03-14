class CreateOptionSelectionRecords < ActiveRecord::Migration
  def change
    create_table :option_selection_records do |t|
      t.belongs_to :user, index: true
      t.belongs_to :option, index: true
    
      t.timestamps null: false
    end
  end
end

class CreateHouseRecords < ActiveRecord::Migration
  def change
    create_table :house_records do |t|
      t.belongs_to :house, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end

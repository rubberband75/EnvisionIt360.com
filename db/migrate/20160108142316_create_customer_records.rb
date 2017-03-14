class CreateCustomerRecords < ActiveRecord::Migration
  def change
    create_table :customer_records do |t|
      # t.integer :user_id, index: true 
      t.integer :contractor_id, index: true
      t.integer :customer_id, index: true
      t.belongs_to :house, index: true
      

      t.timestamps null: false
    end
  end
end

class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :sender_name
      t.string :sender_email
      t.text :message_text

      t.timestamps null: false
    end
  end
end

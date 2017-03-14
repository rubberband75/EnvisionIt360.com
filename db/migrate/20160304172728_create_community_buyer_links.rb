class CreateCommunityBuyerLinks < ActiveRecord::Migration
  def change
    create_table :community_buyer_links do |t|
      t.integer :community_id, index: true
      t.integer :buyer_id, index: true

      t.timestamps null: false
    end
  end
end

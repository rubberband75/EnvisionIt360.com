class CreateCommunityHouseLinks < ActiveRecord::Migration
  def change
    create_table :community_house_links do |t|
      t.belongs_to :house, index: true
      t.belongs_to :community, index: true
      
      t.timestamps null: false
    end
  end
end

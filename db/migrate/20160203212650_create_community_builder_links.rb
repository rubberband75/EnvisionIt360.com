class CreateCommunityBuilderLinks < ActiveRecord::Migration
  def change
    create_table :community_builder_links do |t|
      t.belongs_to :user, index: true
      t.belongs_to :community, index: true

      t.timestamps null: false
    end
  end
end

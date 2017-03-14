class AddPriceAddressCommunityToCustomerRecord < ActiveRecord::Migration
  def change
    add_column :customer_records, :price, :string
    add_column :customer_records, :address, :string
    add_column :customer_records, :community_id, :integer
  end
end

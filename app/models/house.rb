class House < ActiveRecord::Base
    has_many :house_records
    has_many :users, through: :house_records
    has_many :customer_records
    
    has_many :option_links
    has_many :options, through: :option_links
    
    has_one :community_house_link
    has_one :community, through: :community_house_link
    
    mount_uploader :picture, HousepicUploader
    mount_uploader :file, HousefileUploader
    mount_uploader :meta, HousefileUploader
end

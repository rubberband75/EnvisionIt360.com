class Community < ActiveRecord::Base
    has_one :community_builder_link
    has_one :user, through: :community_builder_link
    
    has_many :community_house_links
    has_many :houses, through: :community_house_links
    
    
    
end

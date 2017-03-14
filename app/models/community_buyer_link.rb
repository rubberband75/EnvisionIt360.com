class CommunityBuyerLink < ActiveRecord::Base
    belongs_to :community
    belongs_to :buyer, :class_name => 'User'
end

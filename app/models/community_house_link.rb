class CommunityHouseLink < ActiveRecord::Base
    belongs_to :community
    belongs_to :house
end
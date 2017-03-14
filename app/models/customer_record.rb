class CustomerRecord < ActiveRecord::Base
    #belongs_to :user
    belongs_to :contractor, :class_name => 'User'
    belongs_to :customer, :class_name => 'User'
    belongs_to :house
    belongs_to :community
end

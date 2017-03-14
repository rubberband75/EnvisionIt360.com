class User < ActiveRecord::Base
    has_many :house_records
    has_many :houses, through: :house_records
    
    
    has_many :customer_links, :class_name => "CustomerRecord", :foreign_key => "contractor_id"
    has_many :customers, :through => :customer_links, :source => :customer
    
    has_one :contractor_link, :class_name => "CustomerRecord", :foreign_key => "customer_id"
    has_one :contractor, :through => :contractor_link, :source => :contractor
    
    has_one :assigned_house, :through => :contractor_link, :source => :house
    
    has_many :option_selection_records
    has_many :selected_options, through: :option_selection_records, source: :option
    
    
    
    
    has_many :community_builder_links
    has_many :communities, through: :community_builder_links
    
    
    
    
    
    
    def self.search(query)
        User.where(:first_name, query)
    end
  
    
    has_secure_password
    
    def admin?
        self.role == 'admin'
    end
    
    def buyer?
        self.role == 'buyer'
    end
    
    def builder?
        self.role == 'builder'
    end
    
    def get_pending
        self.houses.where(status: "pending").count
    end
    
end

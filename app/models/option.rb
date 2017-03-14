class Option < ActiveRecord::Base
    mount_uploader :file, OptionUploader
    
    has_many :option_links
    has_many :houses, through: :option_links
    
    has_many :option_selection_records
    has_many :chosen_by, through: :option_selection_records, source: :user
    
    def self.getTypes
       @types = self.all.collect { |x| x.category }.uniq
       return @types
    end
    
end

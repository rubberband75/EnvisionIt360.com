class AdminController < ApplicationController
    before_action :require_admin
    
    def users
        @users = User.all
        
        if @filter = params[:filter]
            @users = User.where(role: @filter)
        end
        
        if params[:search]
            @query = params[:search]
            
            # http://stackoverflow.com/questions/11816919/rails-activerecord-search-on-multiple-attributes
            #@users = User.where(first_name: @query)
            #@users = User.where("first_name like ?", "%#{@query}%")
            @users = User.where("last_name LIKE ? OR first_name LIKE ? OR email LIKE ?", "%#{@query}%","%#{@query}%","%#{@query}%")
        end
        
        
    end
    
    
    def houses
        @users = User.all
        @builders = User.where(role: "builder")
        @houses = House.all
        
        if @filter = params[:filter]
            @houses = User.find(@filter).houses
        else
            @houses = House.all
        end
        
    end
    
    
    def options
        @options = Option.all
        @categorys = @options.collect { |o| o.category }.uniq
        
        if params[:category]
            @options = Option.where(category: params[:category])
        end
    end
    
    
    def messages
       
       @messages = Message.all.reverse
        
    end
  
end

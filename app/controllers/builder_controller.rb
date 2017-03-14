class BuilderController < ApplicationController
    before_action :require_builder
    
    def houses
        @houses = current_user.houses
        @homes = current_user.houses
        @ready = @homes.where(status: "ready")
        
        @pending = @homes.where(status: "pending")
        
    end
    
    
    def customers
        @user = current_user
        @customers = @user.customers
        @communities = @user.communities
        
        if params[:community]
           @community = Community.find(params[:community])
           
           @peeps = Array.new
           
           @customers.each do |customer|
              if customer.assigned_house && customer.assigned_house.community == @community
                 @peeps << customer
              end
           end
           
            @customers = @peeps
            
        end
    end
    
    
    def customer_info
        @user = current_user
        
        @customer = current_user.customers.find_by(id: params[:id])
        @houses = @user.houses
        
        @house = "none" #House.find(params[:id])
        @house_options = @houses.map{|h| [ h.name, h.id ] }
        
        @house_options.unshift( ['none', nil]);
        
        @current = @customer.assigned_house.id if @customer.assigned_house
        
        
        
        
        
        #@communities = @user.communities
        @community = Community.second
        @communities = @user.communities
        @communitiesList = @communities.map{|c| [ c.name, c.id ] }
        
        @communitiesList.unshift( ['none', nil] );
        @CustomerRecord = @customer.contractor_link
        @current_community = @CustomerRecord.community_id
        
        
        puts "!!!!!!!!!!!!!!!!!!!!!!!!!"
        
        
        
        
        
    end
    
    
    def options
        @options = Option.all
        @categorys = @options.collect { |o| o.category }.uniq
        
        if params[:category]
            @options = Option.where(category: params[:category])
        end
    end
    
    
    def communities
       @user = current_user
       @communities = @user.communities
       
       if @selected = params[:id]
           @community = @user.communities.find(@selected)
           @houses = @user.communities.find(@selected).houses
       end
    end
    
    
    def createCommunity
        @community = Community.new(community_params)
        
        current_user.communities << @community
        
        
        @community.save
        
        redirect_to my_customers_path
    end
    
    
    
    private
    def community_params
        params.require(:community).permit(:name) 
    end
end

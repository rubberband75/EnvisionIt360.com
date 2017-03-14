class HousesController < ApplicationController
    
    before_action :require_user
  
    
    def index
        @houses = House.all
    end
    
    def show
        @house = House.find(params[:id])
        @options = @house.options
        
        
        
    end
    
    def edit
        @house = House.find(params[:id])
        @options = Option.all
        
        
        #if current_user.builder?
           
           #@house.users needs to be @house.builder
           @communities = @house.users.first.communities
           
           @communitiesList = @communities.map{|c| [ c.name, c.id ] }
           
           @communitiesList.unshift( ['none', nil] );
           
           @current = nil
           
           @current = @house.community.id if @house.community
            
           
        #end
    end
    
    def update
        @house = House.find(params[:id])
        
        puts ">>>>>>>> UPDATING HOUSE <<<<<<<<<"
        
        if params[:op_hash]
            @house.options.clear
            params[:op_hash].each do |k, v|
               @op = Option.find(k)
               @house.options << @op
            end
        end
        
        if params[:house][:community]
            if params[:house][:community] == ""
                @house.community_house_link.destroy
            else
                @house.community = Community.find(params[:house][:community])
            end
            @house.save
        end
        
        if @house.update(house_params)
            redirect_to @house
        else
            render 'edit'
        end
    end
    
    def new
        @house = House.new
    end
    
    def create
        @house = House.new(house_params)
        
        if current_user.builder?
            @house.status = "pending"
            current_user.houses << @house
        end
        
        if @house.save
            redirect_to @house
        else
            redirect_to "#"
        end
    end
    
    def destroy
        @house = House.find(params[:id])
        @house.destroy
        
        if current_user.admin?
            redirect_to '/houses'
            
        end 
        
        if current_user.builder?
            redirect_to '/my-houses'
            
        end
    end
    
    
    private
    def house_params
        params.require(:house).permit(:name, :address, :image, :picture, :file, :status, :score, :meta)
    end
    
    
end

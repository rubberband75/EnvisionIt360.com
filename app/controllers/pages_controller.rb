class PagesController < ApplicationController
    
    before_action :require_user, except: [:home, :home2, :createMessage, :houseViewer, :loginStats]
    
    def game
        #render :layout => false
    end
    
    def index
        
        if current_user
            @username = current_user.first_name
        else
            redirect_to login_url
        end
        
    end
    
    def dashboard
        
        if current_user
            @username = current_user.first_name
            
            @house = current_user.assigned_house

        else
            redirect_to root_url
        end
    end
    
    def home
        
        
        if current_user
            redirect_to dashboard_url
        end
        
        
    end
    
    def home2
       
        
        
    end
    
    
    def my_houses
        @user = current_user
        @houses = @user.houses
    end
    
    def my_customers
        @user = current_user
        @customers = @user.customers
        
    end
    
    def show_customer
        @user = current_user
        
        @customer = current_user.customers.find_by(id: params[:id])
        @houses = @user.houses
        
        @house = "none" #House.find(params[:id])
        @house_options = @houses.map{|h| [ h.name, h.id ] }
    end
    
    def loginStats
       puts ">>>>> ACCESSSING LOGIN STATS <<<<<" 
       @users = User.all
       
       @users.each do |u|
           u.loginCount = 0
           u.save
       end
       
       puts @stats
       
       
    end
    
    def houseVier
        
    end
    
    
    
    
    
    def createMessage 
        
        puts "!!!!!!!!!!!!!!!!!!"
        puts message_params
        
        @message = Message.new(message_params)
        @message.save
        
        redirect_to root_url
    end
    
    private
    def message_params
        params.require(:message).permit(:sender_name, :sender_email, :message_text)
    end

    
    
end 

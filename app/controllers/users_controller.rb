class UsersController < ApplicationController
  
  before_action :require_user, except: [:new]
  
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @users = @user.customers
    @houses = @user.houses
    
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @redirect = @user
    
    if @user.update(user_params)
      
      if params[:user][:assigned_house]
        if params[:user][:assigned_house] == ""
          puts "!!!!!!!!!!!!!!!!"
          @record = @user.contractor_link.house = nil
        else
          @home = House.find(params[:user][:assigned_house])
          @user.assigned_house = @home
        end
      end
      
      if params[:commit] == "Update House"
        @redirect = "/my-customers/" + @user.id.to_s
      end
      
      redirect_to @redirect
    else
      render 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    
    if current_user
      currentID = current_user.id
      userID = @user.id
    end
    
    @user.destroy
    
    if currentID == userID
      redirect_to '/logout'
    else
      redirect_to '/users'
    end
  end
  
  
  def new
    @user = User.new
    @houses = House.all
    
    if current_user.builder?
      @houses = current_user.houses
    end
    
    @house_options = @houses.map{|h| [ h.name, h.id ] }
    
  end
  
  def create
    @user = User.new(user_params)
    
    
    
    if @user.save
      
      if current_user.builder?
        current_user.customers << @user
        @user.role = "buyer"
        
        @home = House.find(params[:user][:assigned_house])
        @user.assigned_house = @home
        
        @user.save
      end
      
      redirect_to root_url
      
    else
      redirect_to '/signup'
    end
  end
  

  
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :role)
  end
  
end

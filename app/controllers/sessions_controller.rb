class SessionsController < ApplicationController
    
    def new
        redirect_to root_url
    end
    
    def create
        @user = User.find_by_email(params[:session][:email])
        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            @user.loginCount += 1
            @user.save
            
            redirect_to '/'
        else
            redirect_to root_url
        end
    end
    
    def destroy
        session[:user_id] = nil
        redirect_to root_url
    end
end

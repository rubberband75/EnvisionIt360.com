class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user
  helper_method :current_house
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def current_house
    @current_house ||= House.find(session[:house_id]) if session[:house_id]
  end
  
  def require_user
    redirect_to root_url unless current_user
  end
  
  def require_admin
    redirect_to root_url unless current_user.admin?
  end
  
  def require_builder
    redirect_to root_url unless current_user.builder?
  end
  
  
  
end

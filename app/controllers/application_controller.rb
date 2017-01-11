class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  

  protected 
  def authenticate_user!
		redirect_to root_path,alert:'you have to login first' unless user_signed_in?
  end

  def authenticate_admin!
		redirect_to root_path,alert:'you have to be an admin' unless current_user.try(:admin?)
  end 
  
end

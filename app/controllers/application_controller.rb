class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= Donor.find(session[:user_id]) if session[:user_id]
  end

  def redirect_if_not_logged_in
   	if !logged_in?
    	redirect_to home_show_path, alert: "Error:  You must be logged in to see that page!"
    end
  end

  def logged_in?
    !!current_user                
  end

end
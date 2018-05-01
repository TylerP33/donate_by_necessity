class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= Donor.find(session[:user_id]) if session[:user_id]
  end

  def redirect_if_not_logged_in
   	if !logged_in?
    	redirect_to login_path, alert: "Please login to access your donor pag"
  end

  def logged_in?
    !!current_user                #
  end

end
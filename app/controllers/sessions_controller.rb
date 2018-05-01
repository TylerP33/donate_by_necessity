class SessionsController < ApplicationController

	def new

	end 
	
	def create
		donor = Donor.find_or_create_by_omniauth(request.env["omniauth.auth"])
    	session[:user_id] = donor.id
    	redirect_to root_path
  	end

	def destroy
    	session[:user_id] = nil
    	redirect_to root_path
	end

end 
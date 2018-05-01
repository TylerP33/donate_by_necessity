class SessionsController < ApplicationController

	def new
	end 
	
	def create
		if auth_hash = request.env["omniauth.auth"]
			donor = Donor.find_or_create_by_omniauth(request.env["omniauth.auth"])
    		session[:user_id] = donor.id
    		redirect_to root_path
    	else
    	donor = Donor.find_by(email: params[:email])
      	if donor && donor.authenticate(params[:password])
        	session[:user_id] = donor.id
        	redirect_to root_path
      	else
        	render "sessions/new"
     	 end
       end
  	end

	def destroy
    	session[:user_id] = nil
    	redirect_to root_path
	end

end 
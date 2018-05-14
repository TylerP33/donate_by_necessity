class SessionsController < ApplicationController

	def new
	end 
	
	def create
		if auth_hash = request.env["omniauth.auth"]
			donor = Donor.find_or_create_by_omniauth(request.env["omniauth.auth"])
    		session[:user_id] = donor.id
    		redirect_to donor_interface_path
    	else
    	donor = Donor.find_by(email: params[:email])
      	if donor && donor.authenticate(params[:password])
        	session[:user_id] = donor.id
        	redirect_to donor_interface_path
      	else
          flash[:alert] = "Error:  Either your password or email is wrong, or we can't find the account.  Please try again!"
        	render "sessions/new"
     	 end
       end
  	end

	def destroy
    	session[:user_id] = nil
    	redirect_to home_show_path
	end

end 
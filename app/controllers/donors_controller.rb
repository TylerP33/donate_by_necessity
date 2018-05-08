class DonorsController < ApplicationController	
	def donor_home
		@categories = Category.all
	end


	def new
		@donor = Donor.new
	end

	def create
		@donor = Donor.new(donor_params)
		if @donor.save
			session[:user_id] = @donor.id
			redirect_to donor_interface_path
		else
			render :new
		end
	end

	private 
	
	def donor_params
		params.require(:donor).permit(:email, :password, :password_confirmation)
	end
end
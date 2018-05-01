class DonorsController < ApplicationController
	def new
		@donor = Donor.new
	end

	def create
		@donor = Donor.new(donor_params)
	if @donor.save
		session[:donor_id] = @donor.id
		redirect_to root_path
	else
		render :new
	end

	private 
	
	def donor_params
		params.require(:donor).permit(:email, :password, :password_confirmation)
	end
end

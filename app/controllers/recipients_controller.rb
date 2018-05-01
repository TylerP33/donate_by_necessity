class RecipientsController < ApplicationController

	def index
		@recipients = Recipient.all

	def new
		@recipient = Recipient.new
	end 

	def edit

	end 

	def create
		@recipient = Recipient.new(recipient_params)
		respond_to do |format|
			if @recipient.save
				format.html {redirect_to @recipient, notice: 'New Recipient was succesfully created'}
			else
				format.html {render :new}
			end
		end
	end 


	def recipient_params
		params.require(:recipient).permit(
			:first_name,
			:last_name,
			:location,
			:gender,
			:personal_notes,
			:urgent_needs
			)
	end


end

end

class RecipientsController < ApplicationController

	before_action :set_category, only: [:show, :edit, :update, :destroy]

	def new
		@recipient = Recipient.new
	end 

	def edit

	end 

	def create
		@recipient = Category.recipients.build(recipient_params)
		@recipient[:donor_id] = current_user.id
		respond_to do |format|
		if @recipient.save
			 format.html { redirect_to donor_interface_path, notice: 'Recipient was successfully created.' }
		else
			puts @recipient.errors.inspect
			 format.html { render 'recipients/new'}
		end
	  end
	end

	private 

	def set_category
		@category = Category.find(params[:category_id])
	end

	def recipient_params
		params.require(:recipient).permit(
			:first_name,
			:last_name,
			:location,
			:gender,
			:personal_notes,
			:category_id
			)
	end

end



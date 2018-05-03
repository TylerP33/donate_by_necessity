class RecipientsController < ApplicationController

	def index
		@recipients = Recipient.all
	end

	def new
		@recipient = Recipient.new
	end

	def show
		@recipient = Recipient.find_by(last_name: params[:last_name])
		@category = Category.new
	end

	def edit

	end 

	def create
		@recipient = Category.new.recipients.build(recipient_params)
		@recipient[:donor_id] = current_user.id
		respond_to do |format|
		if @recipient.save
			 format.html { redirect_to donor_interface_path, notice: 'Recipient was successfully created.' }
		else
			puts @recipient.errors.inspect
			 format.html { render :new }
		end
	  end
	end

	private 

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



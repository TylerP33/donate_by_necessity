class RecipientsController < ApplicationController

	def new
		@recipient = Recipient.new
	end

	def show
		@recipient = Recipient.find_by(params[:id])
	end

	def edit

	end 

	def create
		@category = Category.find(params[:category_id])
		@recipient = @category.recipients.build(recipient_params)
		@recipient[:donor_id] = current_user.id
		respond_to do |format|
		if @recipient.save
			 format.html { redirect_to donor_interface_path, notice: 'Recipient was successfully created.' }
		else
			 format.html { render :new }
		end
	  end
	end

	def edit
		@recipient = Recipient.find_by(id: params[:id])
	end

	def update
		@category = Category.find_by(id: params[:id])
		@recipient = @category.recipients.find(params[:id])
		if @recipient.update(recipient_params)
			@recipient.update(recipient_params)
			redirect_to donor_interface_path
		else
			render :edit
		end
	end

	def destroy
		@category = Category.find_by(id: params[:id])
		@recipient = @category.recipients.find(params[:id])
		@recipient.destroy
		redirect_to donor_interface_path
	end 

	private 

	def recipient_params
		params.require(:recipient).permit(
			:first_name,
			:last_name,
			:location,
			:gender,
			:personal_notes,
			:category_id,
			:donor_id
			)
	end

end





class RecipientsController < ApplicationController

	before_action :redirect_if_not_logged_in
	before_action :set_recipient, only: [:show, :edit, :update, :destroy]

	def show
		@recipient.donor == current_user
		@category = Category.find(params[:category_id])
		@next_recipient = @category.recipients.find_by(category_id: @category.id)

		respond_to do |format|
		format.html {render :show}
		format.json {render json: @next_recipient}
	  end
	end

	def create
		@category = Category.find(params[:category_id])
		@recipient = @category.recipients.build(recipient_params)
		@recipient[:donor_id] = current_user.id
		@recipient[:id] = @category.id
		if @recipient.save
			 redirect_to donor_interface_path, notice: 'Recipient was successfully created.'
		else
			 render :_form
		end
	end

	def edit
		if @recipient.donor == current_user
			render :edit
		else
			redirect_to donor_interface_path, alert: "Error: That was not your recipient! Record not updated!"
		end
	end

	def update
		@category = Category.find(params[:id])
		@recipient = @category.recipients.find(params[:id])
		if @recipient.update(recipient_params)
			redirect_to donor_interface_path
		else
			render :edit
		end
	end

	def destroy
		if @recipient.donor == current_user
		   @recipient.destroy
		    redirect_to donor_interface_path
		else
		    redirect_to donor_interface_path, alert: "Error: That was not your recipient! Record not deleted!"
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
			:category_id,
			:donor_id
			)
	end

	def set_recipient
		@recipient = Recipient.find_by(id: params[:id])
	end

end

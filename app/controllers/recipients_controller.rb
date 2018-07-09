class RecipientsController < ApplicationController

	before_action :redirect_if_not_logged_in
	before_action :set_recipient, only: [:show, :edit, :update, :destroy]

	def index
		@recipients = current_user.recipients.all
		respond_to do |format|
		format.html {render :show}
		format.json {render json: @recipients}
	  end
	end 

	def show
		@recipient.donor == current_user
		@category = current_user.categories.find_by(params[:category_id])
		@category_grabber = current_user.recipients.find_by(id: params[:id])

		respond_to do |format|
		format.html {render :show}
		format.json {render json: @category_grabber}
	  end
	end

	def next
		@recipient = current_user.recipients.find_by(id: params[:id])
		@next_recipient = @recipient.next_recipient
		render json: @next_recipient
	end

	def create
		@category = Category.find(params[:category_id])
		@recipient = @category.recipients.build(recipient_params)
		@recipient[:donor_id] = current_user.id
		@recipient[:id] = @category.id
		if @recipient.save
			 render json: @recipient, status: 201
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

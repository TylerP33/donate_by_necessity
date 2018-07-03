class CategoriesController < ApplicationController
	before_action :redirect_if_not_logged_in

	def index
		@categories = Category.all
		respond_to do |format|
		format.html {render :index}
		format.json {render json: @categories }
	    end
	end 

	def new
		@category = current_user.categories.new
	end

	def show
		@category = Category.find_by(id: params[:id])
		@recipient = Recipient.new
		@categories = @category.recipients
	end


	def create
		@category = Category.new(category_params)
		if @category.save
			@category.recipients.find_or_create_by(donor_id: current_user.id, category_id: @category.id)
			redirect_to category_url(@category)
		else
			render :new
		end
	end

	def total_user_donation
		@total_user_donation = Category.total_user_donation(current_user)
	end

	private

		def category_params
			params.require(:category).permit(
				:toilet_paper,
				:dental_hygiene,
				:first_aid,
				:general_hygiene,
				:underwear_socks,
				:blankets,
				:school_supplies,
				:diapers
				) 
	end
end

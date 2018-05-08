class CategoriesController < ApplicationController

	def new
		@category = current_user.categories.new
	end

	def show
		@category = Category.find_by(id: params[:id])
		@recipient = Recipient.new
		@categories = @category.recipients
	end 

	def create
		@category = current_user.categories.new(category_params)
		if @category.save
			@category.recipients.find_or_create_by(donor_id: current_user.id, category_id: @category.id)
			redirect_to category_url(@category)
		else
			render 'categories/_form', alert: "Your donation was not saved."
		end
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
				:recipient_id,
				:diapers
				) 
	end
end

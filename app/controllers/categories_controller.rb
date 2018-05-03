class CategoriesController < ApplicationController


	def create
		@category = Category.new(category_params)
		if @category.save
			redirect_to donor_interface_path
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
				:diapers
				) 
	end
end

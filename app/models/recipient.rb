class Recipient < ApplicationRecord
	belongs_to :donor
	belongs_to :category, dependent: :destroy

	validates :first_name, :last_name, :location, :gender, presence: true

	before_destroy do 
		@category = self.category
	end

	after_destroy do 
		unless @category.recipients.any?
			@category.destroy
		end
	end
end

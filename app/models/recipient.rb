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

	def next_recipient
		donor = self.donor
		next_recipient = Recipient.where("id > ? AND donor_id = ?", id, donor.id).first
		reset_count = Recipient.where("donor_id = ?", donor.id).first
		next_recipient ? next_recipient : reset_count
	end

end


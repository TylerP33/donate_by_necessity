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

		nextRecipient = Recipient.where("id > ? AND donor_id = ?", id, donor.id).first
		if nextRecipient
			nextRecipient
		else
			Recipient.where("donor_id = ?", donor.id).first
		end
	end
	
end

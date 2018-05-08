class Recipient < ApplicationRecord
	belongs_to :donor
	belongs_to :category

	validates :first_name, :last_name, :location, :gender, presence: true
end

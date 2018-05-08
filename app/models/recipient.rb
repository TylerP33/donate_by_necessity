class Recipient < ApplicationRecord
	belongs_to :donor
	belongs_to :category, dependent: :destroy

	validates :first_name, :last_name, :location, :gender, presence: true
end

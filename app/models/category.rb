class Category < ApplicationRecord
	has_many :recipients
	has_many :donors, through :recipients
end

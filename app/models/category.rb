class Category < ApplicationRecord
	has_many :recipients, dependent: :destroy
	has_many :donors, through: :recipients


	def self.total_web_donations
		total = self.toilet_paper_totals + self.diaper_totals + self.dental_hygiene_totals + self.first_aid_totals + self.general_hygiene_totals + self.underwear_socks_totals + self.blankets_totals + self.school_supplies_totals
	end

	def self.toilet_paper_totals
		Category.sum(:toilet_paper)
	end

	def self.diaper_totals
		Category.sum(:diapers)
	end

	def self.dental_hygiene_totals
		Category.sum(:dental_hygiene)
	end

	def self.first_aid_totals
		Category.sum(:first_aid)
	end

	def self.general_hygiene_totals
		Category.sum(:general_hygiene)
	end

	def self.underwear_socks_totals
		Category.sum(:underwear_socks)
	end

	def self.blankets_totals
		Category.sum(:blankets)
	end

	def self.school_supplies_totals
		Category.sum(:school_supplies)
	end
end

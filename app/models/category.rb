class Category < ApplicationRecord
	has_many :recipients, dependent: :destroy
	has_many :donors, through: :recipients

	validates :toilet_paper, :dental_hygiene, :first_aid, :general_hygiene, :underwear_socks, :blankets, :school_supplies, :diapers, :numericality => true, :allow_nil => true, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }

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

	def self.total_user_donation(current_user)
		array = Category.joins(:donors).where("donor_id = ?", current_user.id).pluck(
        'SUM(toilet_paper)',
        'SUM(dental_hygiene)',
        'SUM(first_aid)',
        'SUM(general_hygiene)',
        'SUM(underwear_socks)',
        'SUM(blankets)',
        'SUM(school_supplies)',
        'SUM(diapers)').flatten.compact
        total_user_donation = array.inject(0){|sum, x| sum + x}
    end

    def self.total_donations
    	array = Category.pluck(
        'SUM(toilet_paper)',
        'SUM(dental_hygiene)',
        'SUM(first_aid)',
        'SUM(general_hygiene)',
        'SUM(underwear_socks)',
        'SUM(blankets)',
        'SUM(school_supplies)',
        'SUM(diapers)').flatten.compact
        array.inject(0){|sum, x| sum + x}
    end 
end

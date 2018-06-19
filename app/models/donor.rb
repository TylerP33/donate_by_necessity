class Donor < ApplicationRecord
	has_secure_password

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true
  validates :password, confirmation: true


	has_many :recipients
	has_many :categories, through: :recipients

  def self.highest_donor
    Donor.joins(:categories)
      .select("donors.*, 
        count(categories.toilet_paper) as first_count,
        count(categories.dental_hygiene) as second_count,
        count(categories.first_aid) as third_count,
        count(categories.general_hygiene) as fourth_count,
        count(categories.underwear_socks) as fifth_count,
        count(categories.blankets) as sixth_count,
        count(categories.school_supplies) as seventh_count,
        count(categories.diapers) as eighth_count"
        )
      .group("donors.id")
      .order("first_count DESC, second_count DESC, third_count DESC,
        fourth_count DESC, fifth_count DESC, sixth_count DESC, seventh_count DESC,
        eighth_count DESC")
  end 

 def self.find_or_create_by_omniauth(auth_hash)
    self.where(email: auth_hash["info"]["email"]).first_or_create do |donor|
      donor.password = SecureRandom.hex
    end
  end 
end


#This returns the person with the most donations (not counted)
#def self.highest_donor
    #Donor.joins(:categories)
      #.select("donors.*, count(donors.id) as dcount")
      #.group("donors.id")
      #.order("dcount DESC")
  #end 

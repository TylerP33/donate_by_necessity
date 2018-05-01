class Donor < ApplicationRecord
	has_secure_password

  	validates :email, presence: true
  	validates :email, uniqueness: true
  	validates :password, presence: true
  	validates :password, confirmation: true


	has_many :recipients
	has_many :categories, through: :recipients

 def self.find_or_create_by_omniauth(auth_hash)
    self.where(email: auth_hash["info"]["email"]).first_or_create do |donor|
      donor.password = SecureRandom.hex
    end
  end

end

class Donor < ApplicationRecord
	has_secure_password

  	validates :email, presence: true
  	validates :email, uniqueness: true
  	validates :password, presence: true
  	validates :password, confirmation: true


	has_many :recipients
	has_many :categories, through: :recipients
end

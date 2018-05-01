class Donor < ApplicationRecord
	has_secure_password

  	validates :email, presence: true
  	validates :email, uniqueness: true
  	validates :password, presence: true
  	validates :password, confirmation: true


	has_many :recipients
	has_many :categories, through: :recipients

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |donor|
      donor.provider = auth.provider
      donor.uid = auth.uid
      donor.name = auth.info.name
      donor.oauth_token = auth.credentials.token
      donor.oauth_expires_at = Time.at(auth.credentials.expires_at)
      donor.save!
    end
  end

end

class Admin < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+.\-]+@[a-z\d.\-]+[\w]\.[a-z]{2,}/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
		uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 6 }
	before_save { self.email = email.downcase }

	has_secure_password


end

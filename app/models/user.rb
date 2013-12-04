class User < ActiveRecord::Base
  has_many :roles, through: :users_roles 

  before_create :create_remember_token
  before_save { self.email = email.downcase }
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+.\-]+@[a-z\d.\-]+[\w][^\.]\.[a-z]{2,}/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
		uniqueness: { case_sensitive: false }

	validates :password, presence: true, length: { minimum: 6 }



  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def set_role(role)
  end



  private
  	def create_remember_token
  		self.remember_token = User.encrypt(User.new_remember_token)
  	end

end

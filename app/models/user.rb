class User < ActiveRecord::Base

	# Associations
	belongs_to :drugstore_chain

	# Authentication mechanism enabled
	has_secure_password

	# Validation section
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	
	validates :name, 	presence: true, 
										length: { maximum: 50 }

	validates :email, presence: true,
										format: { with: VALID_EMAIL_REGEX },
										uniqueness: { case_sensitive: false }

	validates :password             , length: { minimum: 6 }, :if => :validate_password?
	validates :password_confirmation, presence: true        , :if => :validate_password?

	# Pre-branche invokes
	before_save { email.downcase! }
	before_create :create_remember_token

	# Ignore password when it doesn't matter
	def validate_password?
	  password.present? || password_confirmation.present?
	end

	# Optimal select
	def User.user_list
		joins("left outer join drugstore_chains on drugstore_chain_id = drugstore_chains.id").select("users.*, drugstore_chains.name as dsc_name, drugstore_chains.phone as dsc_phone")
	end

	# Security functions
	def User.new_remember_token
		SecureRandom.urlsafe_base64	
	end

	# Security functions
	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private

		# Security functions
		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end

end
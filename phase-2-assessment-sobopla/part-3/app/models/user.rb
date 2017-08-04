class User < ActiveRecord::Base
  validates :name, :email, :hashed_password, presence: true
	validates :email, :name, uniqueness: true

  def password
		@password ||= BCrypt::Password.new(hashed_password)
	end

	def password=(plain_text_password)
		@password = BCrypt::Password.create(plain_text_password)
		self.hashed_password = @password
	end

	def self.authenticate(email, password)
		user = User.find_by(email: email)
		if user && user.password == password
			user
		else
			nil
		end
	end
  
end

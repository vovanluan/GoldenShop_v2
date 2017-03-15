class User < ActiveRecord::Base
	has_many :books
	before_save { self.email = email.downcase }
	validates :username, presence: true, 
				uniqueness: {case_sensitive: false},
				length: {minimum: 3, maximum: 25}	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i				
	validates :email, presence: true,
				uniqueness: {case_sensitive: false},
				length: {minimum: 8, maximum: 30},
				format: { with: VALID_EMAIL_REGEX }
	validates :password, presence: true, length: {minimum: 8, maximum: 16}


end
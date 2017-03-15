class User < ActiveRecord::Base
	validates :email, presence: true, length: {minimum: 10, maximum: 30}
	validates :password, presence: true, length: {minimum: 8, maximum: 16}
end
class Book < ActiveRecord::Base
	belongs_to :user
	validates :title, presence: true,
				length: {minimum: 10, maximum: 50}
	validates :description, presence: true,
				length: {minimum: 10, maximum: 150}
	validates :price, presence: true,
	validates :user_id, presence: true	
end

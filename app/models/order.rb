class Order < ActiveRecord::Base
	belongs_to :user
	belongs_to :book
	validates :quantity, presence: true, numericality: {greater_than: 0}
end
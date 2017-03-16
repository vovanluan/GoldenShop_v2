class Book < ActiveRecord::Base
  belongs_to :user
  has_many :book_categories
  has_many :categories, through: :book_categories
	validates :title, presence: true, length: { minimum: 3, maximum: 50}
	validates :description, presence: true, length: { minimum: 10, maximum: 120}
	validates :price, presence: true
end

class Category < ActiveRecord::Base
  has_many :book_categories
  has_many :books, through: :book_categories
  validates :name, presence: true, length: { minimum: 2, maximum: 30 }, uniqueness: true
  validates :description, presence: true, length: { minimum: 20, maximum: 500 }
end

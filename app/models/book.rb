class Book < ActiveRecord::Base
  belongs_to :user
  has_many :orders
  has_many :book_categories
  has_many :categories, through: :book_categories
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 400 }
  validates :price, presence: true
  validates :in_stock, presence: true
  mount_uploader :image, ImageUploader

  def self.search(search)
    where("title LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")
  end
end

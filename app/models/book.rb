class Book < ActiveRecord::Base
  belongs_to :user
  has_many :orders
  has_many :book_categories
  has_many :categories, through: :book_categories
  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 800 }
  validates :user_id, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :in_stock, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  mount_uploader :image, ImageUploader
  # validates :image, presence: true

  def self.search(search)
    where("title LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")
  end
end

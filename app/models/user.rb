class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence: true, uniqueness: { case_sensitive: true } , length: { minimum: 5 }
  has_many :books
  has_many :orders
  mount_uploader :avatar, AvatarUploader
end

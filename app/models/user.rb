class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :books   
	mount_uploader :avatar, AvatarUploader      
	validates_presence_of   :avatar
  validates_integrity_of  :avatar
  validates_processing_of :avatar
end

class Gram < ApplicationRecord
  mount_uploader :picture, PictureUploader
  
  belongs_to :user
  has_many :comments
  validates :picture, presence: true
  validates :message, presence: true
end

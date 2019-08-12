class Gram < ApplicationRecord
  mount_uploader :picture, PictureUploader
  
  belongs_to :user
  
  validates :picture, presence: true
  validates :message, presence: true
end

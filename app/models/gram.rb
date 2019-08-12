class Gram < ApplicationRecord
   mount_uploader :picture, PictureUploader
  
  belongs_to :user

  validates :message, presence: true
end

class Photo < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  has_many :comments

end

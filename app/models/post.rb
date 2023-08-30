class Post < ApplicationRecord
    belongs_to :user
    mount_uploader :image, ImageUploader
    mount_uploader :video, VideoUploader
  
    validates :description, presence: true
  end
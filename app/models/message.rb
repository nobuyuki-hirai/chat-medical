class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :content, presence: true

  mount_uploader :image, ImageUploader
end

class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :content, presence: true, unless: -> { image.present? }
  validates :image, presence: true, unless: -> { content.present? }

  mount_uploader :image, ImageUploader
end

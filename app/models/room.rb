class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users, validate: false
  has_many :messages
  has_one  :events
  belongs_to :creator, class_name: 'User'

  validates :name, presence: true

  mount_uploader :image, ImageUploader
end

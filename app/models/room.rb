class Room < ApplicationRecord
  has_many :user_rooms, dependent: :destroy
  has_many :users, through: :user_rooms, dependent: :destroy
  has_many :messages
  has_one  :events

  mount_uploader :image, ImageUploader

  validates :name,    presence: true, uniqueness: true
  validates :image, presence: true

end

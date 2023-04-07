class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users, validate: false
  has_many :messages
  has_many  :events, dependent: :destroy
  belongs_to :creator, class_name: 'User'

  validates :name, presence: true
  validate  :user_ids_present

  mount_uploader :image, ImageUploader

  def formatted_date
    wd = %w[日 月 火 水 木 金 土]
    created_at.strftime("%Y/%m/%d(#{wd[created_at.wday]})")
  end

  def user_ids_present
    return unless user_ids.length < 3

    errors.add(:base, '招待するユーザーを2名以上選択してください')
  end
end

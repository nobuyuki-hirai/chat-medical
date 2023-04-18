class Talk < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  has_many :reads,    dependent: :destroy

  attribute :read, :boolean, default: false

  validates :text, presence: true, unless: -> { image.present? }
  validates :image, presence: true, unless: -> { text.present? }

  mount_uploader :image, ImageUploader

  def mark_as_read!
    self.read = true
    save
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :room_users, dependent: :destroy
  has_many :rooms, through: :room_users
  has_many :messages
  has_many :relationships
  has_many :events

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  validates :last_name,             presence: true
  validates :first_name,            presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/
  validates :password,              presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
  validates :hobby,                 presence: true
  validates :context,               presence: true, length: { maximum: 300 }
  validates :job_id,                presence: true, numericality: { other_than: 1, message: 'を選択してください' }
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  validates :full_user, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :job, foreign_key: 'job_id'

  def active_hash_model
    ActiveHashModel.find(job_id)
  end

  def full_name
    "#{last_name}#{first_name}"
  end

  def full_user
    "#{last_name}#{first_name}(#{job[:name]})"
  end

  def followed_by?(user)
    follower =  passive_relationships.find_by(following_id: user.id)
    return follower.present?
  end

  mount_uploader :image, ImageUploader
end

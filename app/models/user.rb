class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rooms
  has_many :user_rooms
  has_many :messages
  has_many :relationships
  has_many :events

  validates :last_name,             presence: true
  validates :first_name,            presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :hobby,                 presence: true
  validates :context,               presence: true
  validates :image,                 presence: true
  validates :job_id,                numericality: { other_than: 1, message: "can't be blank" }
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :job, foreign_key: 'job_id'

  def active_hash_model
    ActiveHashModel.find(job_id)
  end

  mount_uploader :image, ImageUploader
end
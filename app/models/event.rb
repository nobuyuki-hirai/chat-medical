class Event < ApplicationRecord
  has_many   :event_participates, dependent: :destroy
  has_many   :participants, through: :event_participates, source: :user
  belongs_to :room
  belongs_to :organizer, class_name: 'User'

  validates :name,       presence: true
  validates :place,      presence: true
  validates :start_time, presence: true
  validates :end_time,   presence: true
  validates :text,       presence: true, length: { maximum: 300 }
end

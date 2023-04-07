class Event < ApplicationRecord
  has_many   :event_participates, dependent: :destroy
  belongs_to :room

  validates :name,       presence: true
  validates :place,      presence: true
  validates :start_time, presence: true
  validates :end_time,   presence: true
  validates :text,       presence: true, length: { maximum: 300 }



end

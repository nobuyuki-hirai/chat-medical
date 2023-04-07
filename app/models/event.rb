class Event < ApplicationRecord
  belongs_to :true, class_name: 'User'
  belongs_to :false, class_name: 'User'
  belongs_to :room

  def start_time
    self.date_and_time
  end

  def end_time
    self.event_finish_time
  end
end
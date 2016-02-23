class Event < ActiveRecord::Base

  belongs_to :creator, class_name: 'User'
  has_many :invites, foreign_key: 'attended_events_id'
  has_many :attendees, through: :invites

  def self.past
    Event.where(["date < ?", Time.now])
  end

  def self.future
    Event.where(["date >= ?", Time.now])
  end

  def attended?(user)
    self.attendees.include?(user)
  end

  def attend_event(user_id)
    user = User.find_by(id: user_id)
    self.attendees.push(user)
  end
end

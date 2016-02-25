class Event < ActiveRecord::Base

  belongs_to :creator, class_name: 'User'
  has_many :invites, foreign_key: 'attended_events_id'
  has_many :attendees, through: :invites

  scope :past, -> { where(["date < ?", Date.today]) }
  scope :future, -> { where(["date >= ?", Date.today]) }


  def self.future
   self.where(["date > ?", Date.today])
  end

  def attended?(user)
    self.attendees.include?(user)
  end

  def attend_event(user_id)
    user = User.find_by(id: user_id)
    self.attendees.push(user)
  end

  def decline_event(user_id)
    user = User.find_by(id: user_id)
    self.attendees.delete(user)
  end
end

class Invite < ActiveRecord::Base

  belongs_to :attendees, class_name: 'User'
  belongs_to :attended_events, class_name: 'Event'
end

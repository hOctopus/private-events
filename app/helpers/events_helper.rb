module EventsHelper

  def past?(event)
    Event.past.include?(event)
  end
end

require 'event'

class EventsCollection
  def initialize(already_booked, available)
    @already_booked = already_booked
    @available = available
  end

  def filter_available_events
    @available.reject do |available_event|
      @already_booked.any? { |booked| booked.clash?(available_event) }
    end
  end
end

require 'date'

class Event
  attr_reader :start, :end

  def initialize(start_datetime:, end_datetime:)
    @start = DateTime.parse(start_datetime)
    @end = DateTime.parse(end_datetime)
  end

  def clash?(event)
    start_overlaps?(event) || end_overlaps?(event)
  end

  def start_time
    @start.strftime("%H%M%S").to_i
  end

  def end_time
    @end.strftime("%H%M%S").to_i
  end

  private

  # Assumption: events do not span over multiple days
  def week_day_conflict?(event)
    @start.wday == event.start.wday
  end

  def start_overlaps?(event)
    (start_time <= event.start_time && end_time > event.start_time) && 
      week_day_conflict?(event)
  end

  def end_overlaps?(event)
    (start_time < event.end_time && end_time >= event.end_time) &&
      week_day_conflict?(event)
  end
end

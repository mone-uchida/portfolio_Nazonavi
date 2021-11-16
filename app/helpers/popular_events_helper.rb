module PopularEventsHelper
  MAX_EVENT_COUNT = 5
  MAX_EVENT_COUNT.freeze

  def popular_events
    @popular_events = Event.all.
      left_joins(:favorites).
      group(:event_id).
      select('events.*,COUNT(`favorites`.`event_id`) AS favorites_count').
      order(favorites_count: :desc).
      limit(MAX_EVENT_COUNT)  
  end
end

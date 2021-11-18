class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  include SessionsHelper

  MAX_EVENT_COUNT = 5
  MAX_EVENT_COUNT.freeze

  @popular_events = Event.all.open.popular_events.limit(MAX_EVENT_COUNT)
end

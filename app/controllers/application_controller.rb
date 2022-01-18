class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_popular_events
  include SessionsHelper

  def set_popular_events
    @popular_events = Event.popular_events
  end
end

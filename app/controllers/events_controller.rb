class EventsController < ApplicationController
  def index
    @events = Event.where("finish_at >= ? OR finish_at = ?", Date.today, [])
  end

  def show
    @event = Event.find_by(id: params[:id])
    @related_events = Event.where(title_id: @event.title_id).where.not(id: @event.id)
  end
end

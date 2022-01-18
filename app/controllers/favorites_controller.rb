class FavoritesController < ApplicationController
  before_action :set_event

  def index
    favorite_event_ids = Favorite.where(user_id: current_user.id).pluck(:event_id)
    favorite_events = Event.where(id: favorite_event_ids)
    @events = favorite_events.open
    @finished_events = favorite_events.where('finish_at < ?', Date.today)
  end

  def create
    Favorite.create(user_id: current_user.id, event_id: params[:id])
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, event_id: params[:id])
    favorite.destroy
  end

  private

  def set_event
    @event = Event.find_by(id: params[:id])
  end
end

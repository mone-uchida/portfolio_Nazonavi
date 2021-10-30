class FavoritesController < ApplicationController
  before_action :set_event

  def index
    favorites = Favorite.where(user_id: current_user.id)
    @finished_events = Event.where("finish_at < ?", Date.today)
    @events = Event.where(id: favorites.ids).where.not(id: @finished_events.ids)
  end

  def create
    favorite = Favorite.create(user_id: current_user.id, event_id: params[:id])
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

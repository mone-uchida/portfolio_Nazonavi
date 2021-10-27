class FavoritesController < ApplicationController
  before_action :set_event

  def create
    favorite = Favorite.create(user_id: current_user.id, event_id: params[:id])
    favorite.save
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, event_id: params[:id])
    favorite.destroy
    favorite.save
  end
  
  
  private
  def set_event
    @event = Event.find_by(id: params[:id])
  end
end

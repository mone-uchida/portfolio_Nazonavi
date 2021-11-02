class SpotsController < ApplicationController
  def show
    @spot = Spot.find_by(id: params[:id])
    @related_events = Event.where(spot_id: params[:id])
  end
end

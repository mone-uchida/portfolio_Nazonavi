class SpotsController < ApplicationController
  def index
    @spots = Spot.all.select(:id, :place, :address, :url) 
  end

  def show
    @spot = Spot.find_by(id: params[:id])
    @related_events = Event.where(spot_id: params[:id])
  end
end

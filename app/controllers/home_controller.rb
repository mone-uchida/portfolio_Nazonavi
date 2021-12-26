class HomeController < ApplicationController
  def top; end

  def index
    @events = Event.open.recent
    gon.events = @events
    gon.spots = Spot.all.select(:id, :lat, :lng).order(id: :asc)
    gon.titles = Title.all.select(:id, :name, :image).order(id: :asc)
    gon.s3_url = "https://#{Rails.application.credentials.aws[:s3_URL]}/titles/event_image/"
  end

  def introduction; end
end

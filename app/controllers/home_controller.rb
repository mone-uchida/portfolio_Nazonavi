class HomeController < ApplicationController
  def top
  end

  def index
    @events = Event.where("finish_at >= ? OR finish_at = ?", Date.today, [])
    gon.events = @events
    gon.spots = Spot.all.select(:lat, :lng)
    gon.titles = Title.all.select(:name, :image)
    gon.s3_url = Rails.application.credentials.aws[:s3_URL]
  end
end

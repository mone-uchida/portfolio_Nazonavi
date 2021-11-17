class EventsController < ApplicationController
  def index
    @events = Event.open.order(id: :desc)
  end

  def show
    @event = Event.find_by(id: params[:id])
    @related_events = Event.open.related(@event)
  end

  def search
    @events = Event.open.joins(:title).where(['titles.name LIKE(?)', "%#{params[:search]}%"])

    if @events.present?
      render "events/index"
    else
      flash[:notice] = "該当するイベントがありませんでした"
      redirect_to "/home"
    end
  end

  def address_search
    @events = Event.open.joins(:spot).where('spots.address LIKE ?', "%#{params[:address]}%")

    if @events.present?
      render "events/index"
    else
      flash[:notice] = "該当するイベントがありませんでした"
      redirect_to "/home"
    end
  end
end

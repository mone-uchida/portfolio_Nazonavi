class EventsController < ApplicationController
  def index
    @events = Event.open.recent
  end

  def show
    @event = Event.find_by(id: params[:id])
    @related_events = Event.open.related(@event)
  end

  def search
    @events = Event.open.joins(:title).where(['titles.name LIKE(?)', "%#{params[:search]}%"]).recent

    if @events.present?
      number = @events.count
      flash[:notice] = "検索結果は#{number}件です"
      render "events/index"
    else
      flash[:notice] = "該当するイベントがありませんでした"
      redirect_to "/home"
    end
  end

  def address_search
    @events = Event.open.joins(:spot).where('spots.address LIKE ?', "%#{params[:address]}%").recent

    if @events.present?
      number = @events.count
      flash[:notice] = "検索結果は#{number}件です"
      render "events/index"
    else
      flash[:notice] = "該当するイベントがありませんでした"
      redirect_to "/home"
    end
  end
end

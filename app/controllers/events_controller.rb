class EventsController < ApplicationController
  def index
    @events = Event.where("finish_at is null OR finish_at >= ?", Date.today)
  end

  def show
    @event = Event.find_by(id: params[:id])
    @related_events = Event.where(title_id: @event.title_id).where.not(id: @event.id)
  end

  def search
    @events = Event.joins(:title).
                where(['titles.name LIKE(?) OR titles.source LIKE(?)', "%#{params[:search]}%", "%#{params[:search]}%"]).
                where("finish_at is null OR finish_at >= ?", Date.today)

    if @events.present?
      render "events/index"
    else
      flash[:notice] = "該当するイベントがありませんでした"
      redirect_to "/home"
    end
  end

  def address_search
    @events = Event.joins(:spot).
                where('spots.address LIKE ?', "%#{params[:address]}%").
                where("finish_at is null OR finish_at >= ?", Date.today)

    if @events.present?
      render "events/index"
    else
      flash[:notice] = "該当するイベントがありませんでした"
      redirect_to "/home"
    end
  end
end

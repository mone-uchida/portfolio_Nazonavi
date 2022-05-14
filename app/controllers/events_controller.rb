class EventsController < ApplicationController
  def index
    @events = Event.open.recent
  end

  def show
    @event = Event.find_by(id: params[:id])
    @related_events = Event.open.related(@event)
    @related_posts = Post.where(title_id: @event.title.id).recent
  end

  def search
    @events = Event.open.joins(:title).where(['titles.name LIKE(?)', "%#{params[:search]}%"]).recent

    if @events.present?
      number = @events.count
      flash[:notice] = "検索結果は#{number}件です"
      render 'events/index'
    else
      flash[:notice] = '該当するイベントがありませんでした'
      redirect_to '/home'
    end
  end

  def address_search
    @events = Event.open.joins(:spot).where('spots.address LIKE ?', "%#{params[:address]}%").recent
    if @events.present?
      number = @events.count
      flash[:notice] = "検索結果は#{number}件です"
      render 'events/index'
    else
      flash[:notice] = '該当するイベントがありませんでした'
      redirect_to '/home'
    end
  end

  def tag_search
    @tag = Tag.find_by(id: params[:id])
    @events = Event.find(EventTag.where(tag_id: params[:id]).group(:event_id).pluck(:event_id))
    if @events.present?
      number = @events.count
      flash[:notice] = "##{@tag.name} に関するイベントは#{number}件です"
      render 'events/index'
    else
      flash[:notice] = "##{@tag.name}に関連するイベントがありませんでした"
      redirect_to '/home'
    end
  end
end

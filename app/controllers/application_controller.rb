class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_popular_events
  include SessionsHelper

  def autheniticate_user
    if current_user.nil?
      flash[:notice] = "ログインが必要です"
      redirect_to("/login")
    elsif current_user.id != params[:id].to_i
      flash[:alert] = "閲覧権限がないため、表示できませんでした"
      redirect_to("/login")
    end
  end

  def set_popular_events
    @popular_events = Event.popular_events
  end
end

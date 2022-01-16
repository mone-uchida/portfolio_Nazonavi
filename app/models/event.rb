class Event < ApplicationRecord
  belongs_to :spot
  belongs_to :title

  has_many :favorites

  with_options presence: true do
    validates :spot_id
    validates :title_id
  end

  delegate :lat, :lng, :place, :address, to: :spot

  delegate :name, :image, :price, :url, :note, :source, to: :title

  scope :open, -> {
    where("finish_at is null OR finish_at >= ?", Date.today)
  }

  scope :recent, -> { order(id: :desc) }

  scope :popular_events, -> {
    find(Favorite.order('count(event_id) desc').limit(5).group(:event_id).pluck(:event_id))
  }

  def self.related(event)
    where(title_id: event.title_id).where.not(id: event.id)
  end
end

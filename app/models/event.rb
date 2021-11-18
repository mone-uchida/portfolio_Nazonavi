class Event < ApplicationRecord
  belongs_to :spot
  belongs_to :title

  has_many :favorites

  with_options presence: true do
    validates :spot_id
    validates :title_id
  end

  delegate :lat,
          :lng,
          :place,
          :address,
          to: :spot
  
  delegate :name,
          :image,
          :price,
          :url,
          :note,
          :source,
          to: :title

  scope :open, -> { 
    where("finish_at is null OR finish_at >= ?", Date.today) 
  }

  scope :recent, -> { order(id: :desc) }

  scope :popular_events, -> {
    left_joins(:favorites).
    group(:event_id).
    select('events.*,COUNT(`favorites`.`event_id`) AS favorites_count').
    order(favorites_count: :desc)
  }

  def self.related(event)
    where(title_id: event.title_id).where.not(id: event.id)
  end
end

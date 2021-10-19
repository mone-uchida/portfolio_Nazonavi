class Event < ApplicationRecord
  belongs_to :spot
  belongs_to :title

  delegate :lat,
          :lng,
          to: :spot
  
  delegate :name,
          :image,
          to: :title

  with_options presence: true do
    validates :spot_id
    validates :title_id
  end
end

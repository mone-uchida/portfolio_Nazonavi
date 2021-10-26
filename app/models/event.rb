class Event < ApplicationRecord
  belongs_to :spot
  belongs_to :title
  has_many :favorite

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

  with_options presence: true do
    validates :spot_id
    validates :title_id
  end
end

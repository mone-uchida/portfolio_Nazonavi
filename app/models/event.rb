class Event < ApplicationRecord
  belongs_to :spot
  belongs_to :title
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

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

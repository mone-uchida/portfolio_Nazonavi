class Spot < ApplicationRecord
  has_many :event
  with_options presence: true do
    validates :place
    validates :address
    validates :lat
    validates :lng
  end
end

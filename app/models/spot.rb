class Spot < ApplicationRecord
  has_many :event
  with_options presence: true do
    validates :name
    validates :address
    validates :lat
    validates :lng
  end
end

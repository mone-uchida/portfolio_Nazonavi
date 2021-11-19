class Spot < ApplicationRecord
  has_many :events

  with_options presence: true do
    validates :place
    validates :address
    validates :lat
    validates :lng
  end

  def display_name
    return self.place
  end
end

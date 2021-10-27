class Title < ApplicationRecord
  has_many :events
  with_options presence: true do
    validates :name
  end
end

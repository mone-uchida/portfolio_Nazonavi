class Title < ApplicationRecord
  has_many :event
  with_options presence: true do
    validates :name
  end
end

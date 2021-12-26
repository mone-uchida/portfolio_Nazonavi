class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :event
  with_options presence: true do
    validates :user_id
    validates :event_id
  end
end

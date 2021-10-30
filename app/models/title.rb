class Title < ApplicationRecord
  has_many :events
  has_many :posts
  
  with_options presence: true do
    validates :name
  end
end

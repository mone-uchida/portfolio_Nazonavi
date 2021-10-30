class Post < ApplicationRecord
  belongs_to :user
  belongs_to :title

  delegate :name, to: :title

  with_options presence: true do
    validates :user_id
    validates :title_id
    validates :content
  end
end

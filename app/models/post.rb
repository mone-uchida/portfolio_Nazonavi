class Post < ApplicationRecord
  belongs_to :user
  belongs_to :title

  delegate :name, to: :title

  delegate :name, :icon, to: :user, prefix: true

  with_options presence: true do
    validates :user_id
    validates :title_id
    validates :content
  end

  validates :content, length: {maximum: 180}

  scope :recent, -> { order(id: :desc) }
end

class User < ApplicationRecord
  has_secure_password

  has_many :favorites
  has_many :posts

  with_options presence: true do
    validates :name
    validates :email
  end

  validates :name, length: {maximum: 20}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: {maximum: 50},
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  def favorite_find(event_id)
    favorites.where(event_id: event_id).exists?
  end
end

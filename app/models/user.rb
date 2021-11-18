class User < ApplicationRecord
  has_secure_password

  has_many :favorites
  has_many :posts

  with_options presence: true do
    validates :name
    validates :email
  end

  validates :name, length: {maximum: 20}
  validates :email, uniqueness: true, length: {maximum: 50}, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  def favorite_find(event_id)
    favorites.where(event_id: event_id).exists?
  end
end

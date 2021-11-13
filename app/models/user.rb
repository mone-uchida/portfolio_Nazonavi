class User < ApplicationRecord
  has_secure_password

  has_many :favorites
  has_many :posts

  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  
  def favorite_find(event_id)
    favorites.where(event_id: event_id).exists?
  end
end

class Dog < ApplicationRecord
  has_many :favorites
  has_many :posts

  validates :name, presence: true
  validates :image_url, presence: true

  #enum color
  enum size: { big: 0, medium: 1, small: 2 }, _prefix: true
  enum vehicle: { car: 0, train: 1 }, _prefix: true
  enum cleaning: { like: 0, dislike: 1 }, _prefix: true
  enum active: { like: 0, dislike: 1 }, _prefix: true
  enum exercise: { like: 0, dislike: 1 }, _prefix: true
  enum home: { kids: 0, none: 1 }, _prefix: true
  enum house: { owned: 0, lent: 1 }, _prefix: true
  
end

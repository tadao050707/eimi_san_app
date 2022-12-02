class Post < ApplicationRecord
  belongs_to :dog
  belongs_to :user

  validates :content, presence: true
end

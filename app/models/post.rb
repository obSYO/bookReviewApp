class Post < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :title, :reviewText, presence: true
end
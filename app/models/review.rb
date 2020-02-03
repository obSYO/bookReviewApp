class Review < ApplicationRecord
  belongs_to :book, optional: true
  belongs_to :user, optional: true

  validates :title, :reviewText, presence: true
end

class Review < ApplicationRecord
  belongs_to :book, optional: true
  belongs_to :user, optional: true

  validates :title, :reviewText, presence: true

  def self.search(search)
    return Review.all unless search
    Review.where('title LIKE(?)', "%#{search}%")
  end

end

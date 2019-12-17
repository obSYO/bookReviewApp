class Book < ApplicationRecord
  belongs_to :user
  has_many :posts
  validates :booktitle, :author, presence: true
end

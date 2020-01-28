class Book < ApplicationRecord
  belongs_to :user
  has_many :reviews
  validates :booktitle, :author, presence: true

  mount_uploader :bookimage, ImageUploader
end

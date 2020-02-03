class Book < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reviews, dependent: :destroy
  validates :booktitle, :author, presence: true

  mount_uploader :bookimage, ImageUploader
end

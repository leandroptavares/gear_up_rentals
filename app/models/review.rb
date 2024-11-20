class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :comments, :rating, presence: true
  validates :comments, length: { maximum: 500 }
end

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :comment, :rating, presence: true
  validates :comment, length: { maximum: 500 }
end

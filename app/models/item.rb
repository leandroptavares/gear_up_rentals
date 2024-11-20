class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  CATEGORIES = ["Outdoor Adventure", "Water Sports", "Winter Sports", "Team Sports", "Fitness & Training", "Cycling", "Recreational Sports", "Extreme Sports"]
  validates :title, :description, :price, :category, :location, presence: true
  validates :category, inclusion: { in: CATEGORIES }
end

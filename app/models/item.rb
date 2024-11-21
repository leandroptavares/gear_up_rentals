class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :review, dependent: :destroy
  has_many :bookings, dependent: :destroy
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  CATEGORIES = ["Outdoor Adventure", "Water Sports", "Winter Sports", "Team Sports", "Fitness & Training", "Cycling", "Recreational Sports", "Extreme Sports"]
  validates :title, :description, :price, :category, :location, presence: true
  validates :category, inclusion: { in: CATEGORIES }

  include PgSearch::Model
  pg_search_scope :search_by_title_and_category_and_location,
    against: [ :title, :category, :location, :description],
  using: {
    tsearch: { prefix: true }
  }
end

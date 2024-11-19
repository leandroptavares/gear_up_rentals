class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :end_date, comparison: { greater_than: :start_date }
  validates :user_id, :item_id, presence: true
end

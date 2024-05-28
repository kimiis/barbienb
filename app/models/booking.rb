class Booking < ApplicationRecord
  # attr_accessor :price_total

  belongs_to :house
  belongs_to :user

  validates :status, inclusion: { in: ["Pending host validation", "Confirmed", "Canceled"] }
  validates :arrival_date, presence: true
  validates :departure_date, presence: true
  validates :price_total, numericality: { greater_than_or_equal_to: 0 }

end

class Booking < ApplicationRecord

  belongs_to :house
  belongs_to :user

  validates :status, inclusion: { in: ["Pending host validation", "Confirmed", "Canceled"] }
  validates :arrival_date, presence: true
  validates :departure_date, presence: true
  validates :price_total, numericality: { greater_than_or_equal_to: 0 }
  validate :dates_are_valid

  private

  def dates_are_valid
    if arrival_date.present? && departure_date.present?
      if arrival_date.strftime("%d/%m/%Y") >= departure_date.strftime("%d/%m/%Y")
        errors.add(:arrival_date, "must be before the departure date")
      end
      if arrival_date < Date.today
        errors.add(:arrival_date, "cannot be in the past")
      end
    end
  end

end

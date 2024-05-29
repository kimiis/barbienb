class House < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many :bookings, dependent: :destroy

  has_many_attached :images

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

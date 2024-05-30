class House < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many :bookings, dependent: :destroy

  has_many_attached :images

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :category, presence: true

  validates :guest, presence: true, numericality: { only_integer: true }
  validates :bath, presence: true, numericality: { only_integer: true }
  validates :bed, presence: true, numericality: { only_integer: true }
  validates :bedroom, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: { only_integer: true }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
    pg_search_scope :search_by_address_date,
    against: [:address, :departure_date, :arrival_date],
    associated_against: {
      user: [:username],
      bookings: [:arrival_date, :departure_date]
    },
    using: {
      tsearch: { prefix: true }
    }
end

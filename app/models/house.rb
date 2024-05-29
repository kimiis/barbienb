class House < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many :bookings, dependent: :destroy

  has_many_attached :images

  validates :name, presence: true
  validates :address, presence: true
  validates :guest, presence: true, numericality: { only_integer: true }
  validates :category, presence: true
  validates :bath, presence: true, numericality: { only_integer: true }
  validates :bed, presence: true, numericality: { only_integer: true }
  validates :bedroom, presence: true, numericality: { only_integer: true }
  validates :pet, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true }

end

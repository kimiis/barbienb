class House < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many :bookings
  
  has_many_attached :images

  validates :name, presence: true
  validates :address, presence: true
  validates :date_debut, presence: true
  validates :date_end, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true }

end

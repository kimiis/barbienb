class Booking < ApplicationRecord
  belongs_to :house
  belongs_to :user

  validates :name, presence: true
  validates :status, inclusion: { in: %w[pending confirmed cancelled] }

  # on définit la valeur par défaut pour le statut a pending grâce à la méthode set_defaut_status
  after_initialize :set_default_status, if: :new_record?

  private

  def set_default_status
    self.status ||= 'pending'
  end
end

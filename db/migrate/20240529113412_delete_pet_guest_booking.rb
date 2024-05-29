class DeletePetGuestBooking < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :guest_number, :integer
    remove_column :bookings, :pet_any, :boolean
  end
end

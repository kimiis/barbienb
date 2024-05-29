class AddGuestPetToBooking < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :guest_number, :integer
    add_column :bookings, :pet_any, :boolean
  end
end

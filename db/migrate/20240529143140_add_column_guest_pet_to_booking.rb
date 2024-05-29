class AddColumnGuestPetToBooking < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :guest, :integer
    add_column :bookings, :pet, :boolean
  end
end

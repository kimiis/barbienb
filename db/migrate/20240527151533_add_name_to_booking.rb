class AddNameToBooking < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :name, :string
  end
end

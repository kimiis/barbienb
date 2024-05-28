class RemoveNameFromBookings < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :name, :string
  end
end

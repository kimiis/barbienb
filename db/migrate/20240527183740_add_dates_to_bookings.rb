class AddDatesToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :arrival_date, :date
    add_column :bookings, :departure_date, :date
  end
end

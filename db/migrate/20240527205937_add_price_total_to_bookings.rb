class AddPriceTotalToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :price_total, :integer
  end
end

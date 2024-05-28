class RemoveDatesFromHouses < ActiveRecord::Migration[7.1]
  def change
    remove_column :houses, :date_debut, :date
    remove_column :houses, :date_end, :date
  end
end

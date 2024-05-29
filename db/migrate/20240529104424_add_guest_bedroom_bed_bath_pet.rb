class AddGuestBedroomBedBathPet < ActiveRecord::Migration[7.1]
  def change
    add_column :houses, :guest, :integer
    add_column :houses, :bedroom, :integer
    add_column :houses, :bed, :integer
    add_column :houses, :bath, :integer
    add_column :houses, :pool, :integer
    add_column :houses, :pet, :boolean
  end
end

class AddNameToHouses < ActiveRecord::Migration[7.1]
  def change
    add_column :houses, :name, :string
  end
end

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# House.destroy_all
User.destroy_all
Category.destroy_all

# seed user
puts "create user"
User.create!([
  { email: 'john@example.com', password: 'password' },
  { email: 'jane@example.com', password: 'password' }
])
puts "created #{User.count} users"

# seed category
puts "create category"
[
  { name: 'T1' },
  { name: 'T2' },
  { name: 'T3' }
].each do |category|
  Category.create!(name: category[:name])
end
puts "created #{Category.count} categories"

# Seed pour les maisons
puts "create house"
House.create!([
  {
    name: 'Villa en ville',
    address: '12 Rue du betton',
    bedroom: 2,
    bed: 2,
    bath: 2,
    pet: 2,
    pool: 2,
    guest: 2,
    description: 'Une charmante maison vue sur route.',
    price: 4000,
    category: Category.last,
    user: User.last
  },
  {
    name: 'Villa en bord de mer',
    address: '12 Rue du betton',
    bedroom: 2,
    bed: 2,
    bath: 2,
    pet: 2,
    pool: 2,
    guest: 2,
    description: 'Une charmante maison vue sur route.',
    price: 4000,
    category: Category.last,
    user: User.last
  },
  {
    name: 'Villa en bord de plage jaune',
    address: '12 Rue du betton',
    bedroom: 2,
    bed: 2,
    bath: 2,
    pet: 2,
    pool: 2,
    guest: 2,
    description: 'Une charmante maison vue sur route.',
    price: 4000,
    category: Category.last,
    user: User.last
  }
])
puts "created #{House.count} houses"

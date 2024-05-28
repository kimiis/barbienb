# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

House.destroy_all

# Seed pour les maisons
# houses = House.create!([
#   {
#     name: 'Belle maison à la campagne',
#     address: '123 Rue de la Campagne',
#     date_debut: '2024-06-01',
#     date_end: '2024-06-15',
#     description: 'Une charmante maison située dans la campagne avec une vue imprenable.',
#     price: 1000,
#     category: Categorie.find[1],
#     user: User.find[1]
#   },

# ])

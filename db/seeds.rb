# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Taxon.destroy_all
Shop.destroy_all

Taxon.create!(name: 'Fruit')
Taxon.create!(name: 'Bio')
Taxon.create!(name: 'Légumes')
Taxon.create!(name: 'Viande')
Taxon.create!(name: 'Poisson')
puts "Created 5 taxons"

5.times do
  shop = Shop.new(name: Faker::Restaurant.name, available_on: DateTime.now)
  shop.slug = shop.name.downcase.split(' ').join('-')
  shop.save
end
puts "Created 5 available shops"


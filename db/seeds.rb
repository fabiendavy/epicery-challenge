# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Taxon.destroy_all
Shop.destroy_all
Product.destroy_all

shop_ids = []
taxon_ids = []

Taxon.create!(name: 'Fruits')
Taxon.create!(name: 'Bio')
Taxon.create!(name: 'Vegetables')
Taxon.create!(name: 'Meat')
Taxon.create!(name: 'Fish')
Taxon.create!(name: 'Cheeses')
Taxon.all.each do |taxon|
  taxon_ids << taxon.id
end
puts "Created 6 taxons"

5.times do
  shop = Shop.new(name: Faker::Restaurant.name, available_on: DateTime.now)
  shop.slug = shop.name.downcase.split(' ').join('-')
  shop.taxon_ids << taxon_ids.sample
  shop.save
  shop_ids << shop.id
end
puts "Created 5 available shops"

5.times do
  shop = Shop.new(name: Faker::Restaurant.name, available_on: DateTime.now + 5)
  shop.slug = shop.name.downcase.split(' ').join('-')
  shop.taxon_ids << taxon_ids.sample
  shop.save
  shop_ids << shop.id
end
puts "Created 5 unavailable shops"

10.times do
  product = Product.new(
    name: Faker::Food.fruits, 
    description: Faker::Lorem.words(number: 6).join(' '), 
    price: (2..6).to_a.sample,
    shop_id: shop_ids.sample)
  product.taxon_ids = Taxon.find_by(name: "Fruits").id
  product.save
end
puts "Created 10 fruits"

10.times do
  product = Product.new(
    name: Faker::Food.vegetables, 
    description: Faker::Lorem.words(number: 6).join(' '), 
    price: (2..6).to_a.sample,
    shop_id: shop_ids.sample)
  product.taxon_ids = Taxon.find_by(name: "Vegetables").id
  product.save
end
puts "Created 10 vegetables"

30.times do
  product = Product.new(
    name: Faker::Food.ingredient, 
    description: Faker::Lorem.words(number: 6).join(' '), 
    price: (2..6).to_a.sample,
    shop_id: shop_ids.sample)
  product.taxon_ids = taxon_ids.sample
  product.save
  end
puts "Created 30 ingredients"

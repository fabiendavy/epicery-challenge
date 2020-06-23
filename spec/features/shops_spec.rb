require 'rails_helper'

RSpec.feature "Shops features", type: :feature do

  scenario "User filters the index view" do
    taxon1 = Taxon.create!(name: 'fruits')
    taxon2 = Taxon.create!(name: 'vegetables')

    shop = Shop.create!(name: 'Test name available', slug: 'test-name-available', available_on: DateTime.now - 1)
    shop2 = Shop.create!(name: 'Test name available 2', slug: 'test-name-available-2', available_on: DateTime.now - 1)
    shop.taxon_ids = [taxon1.id, taxon2.id] # shop 1 has fruits and vegetables
    shop2.taxon_ids = [taxon2.id]           # shop 2 only has vegetables

    visit "/shops"
    expect(page).to have_selector('.card', count: 2)
    visit "/shops?category=fruits"
    expect(page).to have_selector('.card', count: 1)
  end

  scenario "should renders the show template with the right info" do
    shop = Shop.create!(name: 'Test name available', slug: 'test-name-available', available_on: DateTime.now - 1)
    visit '/shops/test-name-available'
    expect(page).to have_text('Test name available')
  end
  
end

require 'rails_helper'

RSpec.describe Shop, type: :model do
  let(:available) { described_class.new(name: 'Test name available', slug: 'test-name-available', available_on: DateTime.now - 1)}
  let(:unavailable) { described_class.new(name: 'Test name unavailable', slug: 'test-name-unavailable', available_on: DateTime.now + 5)}

  it "should be available" do
    expect(available.available_on). to be <= DateTime.now
  end

  it "shouldn't be available" do
    expect(unavailable.available_on). to be >= DateTime.now
  end

  it "should have 2 products" do
    available = Shop.create!(available)
    prod1 = available.products.create!(name: "Product 1", description: "description product 1", price: 10)
    prod2 = available.products.create!(name: "Product 2", description: "description product 2", price: 12)
    expect(available.products).to eq([prod1, prod2])
  end
end

require 'rails_helper'

RSpec.describe ShopsController do
  render_views

  it "should renders the index template" do
    get :index
    expect(response).to render_template("index")
  end

  it "should renders the index template with all the shops" do
    shop = Shop.create!(name: 'Test name available', slug: 'test-name-available', available_on: DateTime.now - 1)
    get :index
    expect(assigns(:shops)).to eq([shop])
  end
end

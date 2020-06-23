class ShopsController < ApplicationController
  before_action :get_categories, only: [:index, :show]
  before_action :set_shop, only: [:show]

  def index
    if params[:category]
      @taxon = Taxon.find_by(name: params[:category])
      @shops = Shop.now_available.each_with_object([]) do |shop, arr|
        shop.taxons.each { |taxon| arr << shop if taxon == @taxon }
      end
    else
      @shops = Shop.now_available
    end
  end

  def show
    @products = @shop.products
  end

  private

  def set_shop
    @shop = Shop.find_by(slug: params[:slug])
  end

  def get_categories
    @categories = Taxon.all.each_with_object([]) do |taxon, arr|
      Shop.now_available.each { |shop| arr << taxon if (shop.taxons.include?(taxon)) }
    end
    @categories.uniq!
  end
end

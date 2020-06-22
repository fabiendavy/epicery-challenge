module Admin
  class ShopsController < ApplicationController
    before_action :set_shop, only: [:show, :edit, :update, :destroy]

    # GET /admin/shops
    def index
      @shops = Shop.all
    end

    # GET /admin/shops/1
    def show
    end

    # GET /admin/shops/new
    def new
      @shop = Shop.new
    end

    # GET /admin/shops/1/edit
    def edit
    end

    # POST /admin/shops
    def create
      @shop = Shop.new(shop_params)
      @shop.taxon_ids = params[:shop][:taxon_ids]

      if @shop.save
        redirect_to [:admin, @shop], notice: 'Shop was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /admin/shops/1
    def update
      if @shop.update(shop_params)
        @shop.taxon_ids = params[:shop][:taxon_ids]
        redirect_to [:admin, @shop], notice: 'Shop was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /admin/shops/1
    def destroy
      @shop.destroy

      redirect_to admin_shops_url, notice: 'Shop was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shop_params
      params.require(:shop).permit(:name, :slug, :available_on)
    end
  end
end

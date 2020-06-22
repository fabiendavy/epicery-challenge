module Admin
  class TaxonsController < ApplicationController
    before_action :set_taxon, only: [:show, :edit, :update, :destroy]

    # GET /admin/taxons
    def index
      @taxons = Taxon.all
    end

    # GET /admin/taxons/1
    def show
    end

    # GET /admin/taxons/new
    def new
      @taxon = Taxon.new
    end

    # GET /admin/taxons/1/edit
    def edit
    end

    # POST /admin/taxons
    def create
      @taxon = Taxon.new(taxon_params)

      if @taxon.save
        redirect_to [:admin, @taxon], notice: 'Taxon was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /admin/taxons/1
    def update
      if @taxon.update(taxon_params)
        redirect_to [:admin, @taxon], notice: 'Taxon was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /admin/taxons/1
    def destroy
      @taxon.destroy
      redirect_to admin_taxons_url, notice: 'Taxon was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_taxon
      @taxon = Taxon.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def taxon_params
      params.require(:taxon).permit(:name)
    end
  end
end

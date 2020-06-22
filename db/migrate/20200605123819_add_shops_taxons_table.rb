class AddShopsTaxonsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :shops_taxons do |t|
      t.references :shop
      t.references :taxon
    end
  end
end

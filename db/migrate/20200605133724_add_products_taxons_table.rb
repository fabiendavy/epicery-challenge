class AddProductsTaxonsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :products_taxons do |t|
      t.references :product
      t.references :taxon
    end
  end
end

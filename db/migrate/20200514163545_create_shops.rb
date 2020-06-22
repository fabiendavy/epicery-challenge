class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :slug
      t.datetime :available_on

      t.timestamps
    end
  end
end

class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :isbn
      t.string :sku
      t.integer :pub_year

      t.timestamps
    end
  end
end

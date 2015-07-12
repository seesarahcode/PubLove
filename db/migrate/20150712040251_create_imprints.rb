class CreateImprints < ActiveRecord::Migration
  def change
    create_table :imprints do |t|
      t.integer :publisher_id
      t.string :name

      t.timestamps
    end
  end
end

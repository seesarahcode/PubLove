class CreatePublishers < ActiveRecord::Migration
  def change
    create_table :publishers do |t|
      t.string :name
      t.string :street
      t.string :state
      t.string :city
      t.integer :zip
      t.string :phone
      t.string :website

      t.timestamps
    end
  end
end

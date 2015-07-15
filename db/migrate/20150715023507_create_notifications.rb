class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :message
      t.integer :book_id
      t.string :type
      t.integer :pm_id

      t.timestamps
    end
  end
end

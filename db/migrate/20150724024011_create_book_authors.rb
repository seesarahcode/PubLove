class CreateBookAuthors < ActiveRecord::Migration
  def change
    create_table :book_authors do |t|
      t.integer :book_id
      t.integer :user_id

      t.timestamps
    end
  end
end

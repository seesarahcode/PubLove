class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.integer :user_id
      t.integer :publisher_id
      t.string :title
      t.date :start_date
      t.text :bio
      t.string :favorite_books
      t.string :phone

      t.timestamps
    end
  end
end

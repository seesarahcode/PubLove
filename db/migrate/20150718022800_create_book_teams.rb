class CreateBookTeams < ActiveRecord::Migration
  def change
    create_table :book_teams do |t|
      t.integer :book_id
      t.integer :user_id
      t.string :team_role

      t.timestamps
    end
  end
end

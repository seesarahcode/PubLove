class CreateTeamRoles < ActiveRecord::Migration
  def change
    create_table :team_roles do |t|
      t.integer :publisher_id
      t.string :title

      t.timestamps
    end
  end
end

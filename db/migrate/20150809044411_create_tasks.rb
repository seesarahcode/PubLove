class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.date :due_date
      t.time :due_time

      t.timestamps
    end
  end
end

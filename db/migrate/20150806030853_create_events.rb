class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_type
      t.date :date
      t.time :time
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end

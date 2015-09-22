class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :plan
      t.boolean :trial
      t.integer :admin_id

      t.timestamps
    end
  end
end

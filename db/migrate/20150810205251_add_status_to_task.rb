class AddStatusToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :status, :string
    add_column :tasks, :book_id, :integer
    add_column :tasks, :assigned_by, :integer
  end
end

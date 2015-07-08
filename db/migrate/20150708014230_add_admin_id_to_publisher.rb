class AddAdminIdToPublisher < ActiveRecord::Migration
  def change
    add_column :publishers, :admin_id, :integer
  end
end

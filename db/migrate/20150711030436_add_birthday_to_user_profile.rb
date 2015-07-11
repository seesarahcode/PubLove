class AddBirthdayToUserProfile < ActiveRecord::Migration
  def change
    add_column :user_profiles, :birthday, :date
  end
end

class UserProfile < ActiveRecord::Base
	belongs_to :users

	validates :user_id, presence: true
end

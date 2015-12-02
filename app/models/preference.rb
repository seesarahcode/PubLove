class Preference < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true

	#set defaults for theme and time zone
end

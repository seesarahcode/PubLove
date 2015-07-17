class Notification < ActiveRecord::Base

	validates :message, :type,  	presence: true

end

module ApplicationHelper

	def current_publisher
		current_user.publisher_id ? Publisher.find(current_user.publisher_id) : nil
	end

end

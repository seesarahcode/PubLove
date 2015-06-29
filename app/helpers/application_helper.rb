module ApplicationHelper

	def current_publisher
		current_user.publisher_id.present? ? Publisher.find(current_user.publisher_id) : nil
	end

end

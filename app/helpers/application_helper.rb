module ApplicationHelper

	def current_publisher
		current_user.publisher_id ? Publisher.find(current_user.publisher_id) : nil
	end

	def dashboard_link
		case current_user.role
		when "super_admin"
			link_to "Dashboard", super_admin_dashboard_path
		when "admin"
			link_to "Dashboard", admin_dashboard_path
		when "project_manager"
			link_to "Dashboard", pm_dashboard_path
		when "author"
			link_to "Dashboard", author_dashboard_path
		else
		end	
	end

	def full_name(user)
		User.find(user).full_name
	end

	def publisher_name(pub_id)
		Publisher.find(pub_id).name
	end

end

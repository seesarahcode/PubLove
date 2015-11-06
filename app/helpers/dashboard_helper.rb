module DashboardHelper

	def calendar_alignment 
		number, content = Date.today.beginning_of_month.wday, ""
		number.times {content << content_tag(:div, "", class: "date-blank") } unless number == 7
		return content.html_safe
	end

	def event_attendee_names(current_user, event)
		names = []
		event.attendees.each do |person|
			unless person.id == current_user.id
				names << person.first_name
			end
			# to-do: return a link to the person's profile
		end	
		names.join(", ")
	end

end

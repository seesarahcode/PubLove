module DashboardHelper

	def calendar_alignment 
		number, content = Date.today.beginning_of_month.wday, ""
		number.times {content << content_tag(:div, "", class: "date-blank") } unless number == 7
		return content.html_safe
	end

	def event_attendee_names(event)
		names = []
		event.attendees.each do |person|
			unless person.id == current_user.id
				names << person.full_name
			end
			# to-do: return a link to the person's profile
		end	
		names.join(", ")
	end

	def date_heat(day)
		date
		events = Event.where(created_at: date.beginning_of_day..date.end_of_day)
		# find events that match that date and count them
		# set heat-class-level (0 events == white, 10 events = dark red)
		# return %div.date.[heat-class-level]
	end

end

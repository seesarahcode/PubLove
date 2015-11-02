module DashboardHelper

	def calendar_alignment 
		number, content = Date.today.beginning_of_month.wday, ""
		number.times {content << content_tag(:div, "", class: "date-blank") } unless number == 7
		return content.html_safe
	end

	def event_attendees(current_user, attendees)
		attendees.each do |person|
			unless person = current_user
				# create a list of their names
			end
			# return string of their names
		end	
	end

end

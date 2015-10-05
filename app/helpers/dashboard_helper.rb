module DashboardHelper

	def calendar_alignment 
		number = Date.today.beginning_of_month.wday
		number.times.inject {content_tag(:div, "", class: "date-blank") } unless number == 7
	end

end

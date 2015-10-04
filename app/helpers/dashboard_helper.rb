module DashboardHelper

	def calendar_alignment 
		number = Date.today.beginning_of_month.wday
		number.times.collect {content_tag(:div, "", class: "date-blank") }.join("") unless number == 7
	end

end

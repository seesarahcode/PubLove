module DashboardHelper

	def calendar_alignment 
		first = Date.today.beginning_of_month.wday
		case first
		when 1
			content_tag(:div, "", class: "date-blank")
		when 2
			content_tag(:div, "", class: "date-blank") + content_tag(:div, "", class: "date-blank") # refactor multiples for conciseness
		when 3
			content_tag(:div, "", class: "date-blank") + content_tag(:div, "", class: "date-blank") + 
			content_tag(:div, "", class: "date-blank")
		when 4
			content_tag(:div, "", class: "date-blank") + content_tag(:div, "", class: "date-blank") + 
			content_tag(:div, "", class: "date-blank") + content_tag(:div, "", class: "date-blank")
		when 5
			content_tag(:div, "", class: "date-blank") + content_tag(:div, "", class: "date-blank") + 
			content_tag(:div, "", class: "date-blank") + content_tag(:div, "", class: "date-blank") + 
			content_tag(:div, "", class: "date-blank")
		when 6
			content_tag(:div, "", class: "date-blank") + content_tag(:div, "", class: "date-blank") + 
			content_tag(:div, "", class: "date-blank") + content_tag(:div, "", class: "date-blank") + 
			content_tag(:div, "", class: "date-blank") + content_tag(:div, "", class: "date-blank")
		else
		end
	end

end

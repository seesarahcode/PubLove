module DashboardHelper

	def calendar_alignment 
		first = Date.today.beginning_of_month.wday
		case first
		when 1
			content_tag(:div, "  ", class: "date")
		when 2
			content_tag(:div, "  ", class: "date") + content_tag(:div, "  ", class: "date") # refactor multiples for conciseness
		when 3
			content_tag(:div, "", class: "date") + content_tag(:div, "", class: "date") + 
			content_tag(:div, "", class: "date")
		when 4
			content_tag(:div, "", class: "date") + content_tag(:div, "", class: "date") + 
			content_tag(:div, "", class: "date") + content_tag(:div, "", class: "date")
		when 5
			content_tag(:div, "", class: "date") + content_tag(:div, "", class: "date") + 
			content_tag(:div, "", class: "date") + content_tag(:div, "", class: "date") + 
			content_tag(:div, "", class: "date")
		when 6
			content_tag(:div, "", class: "date") + content_tag(:div, "", class: "date") + 
			content_tag(:div, "", class: "date") + content_tag(:div, "", class: "date") + 
			content_tag(:div, "", class: "date") + content_tag(:div, "", class: "date")
		else
			puts "Nada"
		end
	end

end

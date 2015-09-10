module DashboardHelper

	def calendar_alignment 
		first = Date.today.beginning_of_month.wday
		case first
		when 1
			content_tag(:p)
		when 2
			content_tag(:p) + content_tag(:p) # refactor multiples for conciseness
		when 3
			content_tag(:p) + content_tag(:p) + content_tag(:p)
		when 4
			content_tag(:p) + content_tag(:p) + content_tag(:p) + content_tag(:p)
		when 5
			content_tag(:p) + content_tag(:p) + content_tag(:p) +
			content_tag(:p) + content_tag(:p)
		when 6
			content_tag(:p) + content_tag(:p) + content_tag(:p) +
			content_tag(:p) + content_tag(:p) + content_tag(:p)
		else
			puts "Nada"
		end
	end

end

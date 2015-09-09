module DashboardHelper

	def calendar_alignment(month) 
		first = Date.today.beginning_of_month.wday #returns 1-7 for M-Sun
		case first
		when 1
			# add one empty div day
		when 2
			# add two empty div days
		when 3
			# add three empty div days
		when 4
			# add four empty div days
		when 5
			# add five empty div days
		when 6
			# add six empty div days
		when 7
			# add seven empty div days
		else
			puts "Uh-oh"
		end
	end

end

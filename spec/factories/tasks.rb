FactoryGirl.define do
	factory :task do 
		title 				"Review author feedback"
		description		"Review author feedback & update cover to match specifications"	
		due_date			Date.today
		due_time			Time.now
		status				"Incomplete"
	end
end
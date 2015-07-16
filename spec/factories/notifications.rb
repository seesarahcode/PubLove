FactoryGirl.define do
	factory :notification do 
		message 			"J.K. Rowling uploaded a draft chapter of HP: Book 8."
		type					"author_upload"
	end
end
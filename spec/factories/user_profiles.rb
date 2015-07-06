FactoryGirl.define do
	factory :user_profile do 
		title								"Senior Project Editor"
		start_date					Faker::Date.between(8.years.ago, Date.today)
		bio									Faker::Lorem.sentence(4, true)
		favorite_books			"Station Eleven, The Stand, The Passage"
		phone								Faker::PhoneNumber.phone_number
	end
end
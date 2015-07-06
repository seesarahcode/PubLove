FactoryGirl.define do
	factory :user_profile do 
		user_id
		publisher_id
		title								"Station Eleven"
		start_date					Faker::Date.between(8.years.ago, Date.today)
		bio									Faker::Lorem.sentence(4, true)
		favorite_books			""
		phone								Faker::PhoneNumber.phone_number
	end
end
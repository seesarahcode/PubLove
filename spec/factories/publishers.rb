# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :publisher do 
    name 					"Booksly & #{Faker::Company.name} Publishing"
    street 				Faker::Address.street_address
    state 				Faker::Address.state
    city 					Faker::Address.city
    zip 					92527
    phone 				Faker::PhoneNumber.phone_number
    website 			"www.bookslyandwordwood.com"

    factory :publisher_with_book do
	    after(:create) do |book|
	      create(:book, publisher: publisher)
	    end
	  end
  end
end

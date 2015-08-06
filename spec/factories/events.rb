FactoryGirl.define do
  factory :event do
  	event_type 			"meeting"
    date						Date.today
    time						Time.now
    title						"Phone call with Jo"
    description			"Quick chat to discuss chapter 1 of HP 8"

    factory :meeting do
    	event_type "meeting"
    end

    factory :phone_call do
    	event_type "phone_call"
    end

    factory :video_conference do
    	event_type "video_conference"
    end

  end
end
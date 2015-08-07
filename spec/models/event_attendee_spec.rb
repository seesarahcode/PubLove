require 'spec_helper'

describe EventAttendee do
  before :each do 
  	@admin = FactoryGirl.create(:admin)
  	@event = FactoryGirl.create(:event)
		@event_attendee = FactoryGirl.create(:event_attendee, user_id: @admin.id, event_id: @event.id)
	end

	describe "responses" do 
		subject { @event_attendee }
		it { should respond_to(:event_id) }
		it { should respond_to(:user_id) }
	  it { should be_valid }
	end

	describe "validations" do
		it "should require an event id" do
			@event_attendee.event_id = ""
			@event_attendee.should_not be_valid
		end
		it "should require a user id" do
			@event_attendee.user_id = ""
			@event_attendee.should_not be_valid
		end
	end
end

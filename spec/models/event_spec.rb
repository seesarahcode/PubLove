require 'spec_helper'

describe Event do
  before :each do 
		@event = FactoryGirl.create(:event)
	end

	describe "responses" do 
		subject { @event }
		it { should respond_to(:event_type) }
		it { should respond_to(:date) }
		it { should respond_to(:time) }
		it { should respond_to(:title) }
		it { should respond_to(:description) }
	  it { should be_valid }
	end

	describe "validations" do
		it "should require an event type" do
			@event.event_type = ""
			@event.should_not be_valid
		end
		it "should require a date" do
			@event.date = ""
			@event.should_not be_valid
		end
		it "should require a time" do
			@event.time = ""
			@event.should_not be_valid
		end
		it "should require a title" do
			@event.title = ""
			@event.should_not be_valid
		end
	end

	describe "associations" do
		context "with attendees" do
			before do
				@user = FactoryGirl.create(:project_manager)
				@event_attendee = FactoryGirl.create(:event_attendee, user_id: @user.id, event_id: @event.id)
			end
			it "should return the event's attendees" do
				@event.attendees.include?(@user).should eq true
			end
			it "should find an event_attendee record with the user's id" do
				e_a = EventAttendee.where(event_id: @event.id).last
				e_a.user_id.should eq @user.id
				e_a.event_id.should eq @event.id
			end
		end
	end
end

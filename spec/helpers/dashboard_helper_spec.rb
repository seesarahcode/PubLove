require 'spec_helper'

describe "DashboardHelper" do
	describe "#calendar_alignment" do
		it "should return one div if the 1st begins on a Monday" do
			Date.stub(:today) { Date.new(2015,6,1) }
			helper.calendar_alignment.should match("<div class=\"date-blank\"></div>")
		end
		it "should return two divs if the 1st begins on a Tuesday" do
			Date.stub(:today) { Date.new(2015,9,1) }
			helper.calendar_alignment.should match("<div class=\"date-blank\"></div>" * 2)
		end
		it "should return three divs if the 1st begins on a Wednesday" do
			Date.stub(:today) { Date.new(2015,7,1) }
			helper.calendar_alignment.should match("<div class=\"date-blank\"></div>" * 3)
		end
		it "should return four divs if the 1st begins on a Thursday" do
			Date.stub(:today) { Date.new(2015,10,1) }
			helper.calendar_alignment.should match("<div class=\"date-blank\"></div>" * 4)
		end
		it "should return five divs if the 1st begins on a Friday" do
			Date.stub(:today) { Date.new(2015,5,1) }
			helper.calendar_alignment.should match("<div class=\"date-blank\"></div>" * 5)
		end
		it "should return six divs if the 1st begins on a Saturday" do
			Date.stub(:today) { Date.new(2015,8,1) }
			helper.calendar_alignment.should match("<div class=\"date-blank\"></div>" * 6)
		end
		it "should return no divs if the 1st begins on a Sunday" do
			Date.stub(:today) { Date.new(2015,3,1) }
			helper.calendar_alignment.should eq ""
		end
	end
	describe "#event_attendee_names" do
		before do 
			@pm = FactoryGirl.create(:project_manager)
			@author = FactoryGirl.create(:author, first_name: "J.K.", last_name: "Rowling")
			@event = FactoryGirl.create(:event)
			@attendee1 = FactoryGirl.create(:event_attendee, user_id: @pm.id, event_id: @event.id)
			@attendee2 = FactoryGirl.create(:event_attendee, user_id: @author.id, event_id: @event.id)
			sign_in(@pm)
		end
		it "should not return the current user's name" do
			helper.event_attendee_names(@event).should_not eq @pm.full_name
		end
		it "should return a list of names" do
			helper.event_attendee_names(@event).should eq @author.full_name
		end
	end
end
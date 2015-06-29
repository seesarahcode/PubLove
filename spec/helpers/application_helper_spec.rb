require 'spec_helper'

describe ApplicationHelper do 

	describe "current_publisher" do
		before :each do
			@pub = FactoryGirl.create(:publisher)
		end
		it "should return a Publisher object" do
			sign_in(FactoryGirl.create(:project_manager, publisher_id: @pub.id))
			response = current_publisher
			response.should be_a_kind_of(Publisher)
		end
		it "should return the publisher associated with the current user" do
			sign_in(FactoryGirl.create(:project_manager, publisher_id: @pub.id))
			response = current_publisher
			response.id.should eq User.last.publisher_id
		end
	end

end
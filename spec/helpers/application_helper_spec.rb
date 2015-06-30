require 'spec_helper'

describe ApplicationHelper do 

	before do
		@pub = FactoryGirl.create(:publisher)
		@user = FactoryGirl.create(:project_manager, :publisher_id => @pub.id)
		sign_in(@user)
	end

	describe "#current_publisher" do
		it "should return a Publisher object" do
			helper.current_publisher.should be_a_kind_of(Publisher)
		end
		it "should return the publisher associated with the current user" do
			helper.current_publisher.id.should eq @user.publisher_id
		end
	end

end
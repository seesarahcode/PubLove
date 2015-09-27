require 'spec_helper'

describe ApplicationHelper do 

	before do
		@pub = FactoryGirl.create(:publisher, admin_id: FactoryGirl.create(:admin).id)
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

	describe "#dashboard_link" do
		it "should link to SA dashboard " do
			pending
		end
		it "should link to admin dashboard" do
			pending
		end
		it "should link to PM dashboard" do
			pending
		end
		it "should link to author dashboard" do
			pending
		end
	end

end
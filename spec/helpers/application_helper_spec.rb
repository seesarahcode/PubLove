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
			sa = FactoryGirl.create(:super_admin)
			sign_in(sa)
			helper.dashboard_link.should eq "<a href=\"/super/dashboard\">Dashboard</a>"
		end
		it "should link to admin dashboard" do
			admin = FactoryGirl.create(:admin)
			sign_in(admin)
			helper.dashboard_link.should eq "<a href=\"/admin/dashboard\">Dashboard</a>"
		end
		it "should link to PM dashboard" do
			pm = FactoryGirl.create(:project_manager)
			sign_in(pm)
			helper.dashboard_link.should eq "<a href=\"/pm/dashboard\">Dashboard</a>"
		end
		it "should link to author dashboard" do
			author = FactoryGirl.create(:author)
			sign_in(author)
			helper.dashboard_link.should eq "<a href=\"/author/dashboard\">Dashboard</a>"
		end
	end

end
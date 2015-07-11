require 'spec_helper'

describe UserProfile do
  before do 
  	@user = FactoryGirl.create(:project_manager)
  	@user_profile = FactoryGirl.create(:user_profile, user_id: @user.id)
  end
  describe "responses" do
  	subject { @user_profile }
		it { should respond_to(:user_id) }
		it { should respond_to(:publisher_id) }
		it { should respond_to(:title) }
		it { should respond_to(:start_date) }
		it { should respond_to(:bio) }
		it { should respond_to(:favorite_books) }
		it { should respond_to(:phone) }
		it { should respond_to(:birthday) }
  end
  describe "validations" do
  	it "should not be valid without a user" do
  		@user_profile.user_id = nil
  		@user_profile.should_not be_valid
  	end
  end
  describe "associations" do
  	context "to user" do
			it "should have a user_id" do
				@user.profile.should be_a_kind_of(UserProfile)
			end
			it "should be included in the results for user.profile" do
				@user.profile.should_not be_nil
				@user.profile.id.should eq @user_profile.id
			end
		end
  end
end

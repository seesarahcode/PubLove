require 'spec_helper'

describe Preference do
  before do 
  	@user = FactoryGirl.create(:project_manager)
  	@preferences = FactoryGirl.create(:preference, user_id: @user.id)
  end
  describe "responses" do
  	subject { @preferences }
		it { should respond_to(:user_id) }
		it { should respond_to(:theme) }
  end
  describe "validations" do
  	it "should not be valid without a user" do
  		@preferences.user_id = nil
  		@preferences.should_not be_valid
  	end
  end
  describe "associations" do
  	context "to user" do
			it "should return a Preference record for .preference" do
				@user.preferences.should be_a_kind_of(Preference)
			end
			it "should be included in the results for user.profile" do
				@user.preferences.should_not be_nil
				@user.preferences.id.should eq @preferences.id
			end
		end
  end
end

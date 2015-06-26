require 'spec_helper'

describe User do
	before do 
		@user = FactoryGirl.create(:user, :email => "editor@lilpublisher.com", :password => "password")
	end

	describe "responses" do
		subject { @user }
		it { should respond_to(:email) }
		it { should respond_to(:password) }
	end

	describe "validations" do
		it "should not be valid without an email address" do 
			@user.email = ""
			@user.should_not be_valid
		end
		it "should not be valid without a password" do
			@user.password = ""
			@user.should_not be_valid
		end
		it "should have a unique email address" do
			user2 = User.new(email: @user.email, password: "password")
			user2.should_not be_valid
		end
	end
end
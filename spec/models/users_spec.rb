require 'spec_helper'

describe User do
	before do 
		@user = FactoryGirl.create(:project_manager, 
			:email => "editor@lilpublisher.com", 
			:password => "password", 
			:role => "project_manager")
	end

	describe "responses" do
		subject { @user }
		it { should respond_to(:email) }
		it { should respond_to(:password) }
		it { should respond_to(:role) }
		it { should respond_to(:first_name) }
		it { should respond_to(:last_name) }
	end

	describe "validations" do
		it "should be valid with valid information" do
			@user.should be_valid
		end
		it "should not be valid without an email address" do 
			@user.email = ""
			@user.should_not be_valid
		end
		it "should have a unique email address" do
			user2 = User.new(email: @user.email, password: "password")
			user2.should_not be_valid
		end
		it "should not be valid without a password" do
			@user.password = ""
			@user.should_not be_valid
		end
		it "should not be valid without a role" do
			@user.role = ""
			@user.should_not be_valid
		end
	end

	describe "#create_profile" do
		it "should create a UserProfile after creating a user" do 

		end
		it "should create a UserProfile with right user_id" do

		end
	end

	describe "#is_super_admin?" do
		it "should return true if the user is a super_admin" do
			@super = FactoryGirl.create(:super_admin)
			@super.is_super_admin?.should eq true
		end
		it "should return false if the user is not a super_admin" do
			@user.is_super_admin?.should eq false
		end
	end

	describe "#is_admin?" do
		it "should return true if the user is an admin" do
			@admin = FactoryGirl.create(:admin)
			@admin.is_admin?.should eq true
		end
		it "should return false if the user is not an admin" do
			@user.is_admin?.should eq false
		end
	end

	describe "#is_pm?" do
		it "should return true if the user is a project_manager" do
			@user.is_pm?.should eq true
		end
		it "should return false if the user is not a project manager" do
			@admin = FactoryGirl.create(:admin)
			@admin.is_pm?.should eq false
		end
	end
	
	describe "#is_author?" do
		it "should return true if the user is an author" do
			@author = FactoryGirl.create(:author)
			@author.is_author?.should eq true
		end
		it "should return false if the user is not an author" do
			@user.is_author?.should eq false
		end
	end
end
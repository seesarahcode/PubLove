require 'spec_helper'

describe Account do
	before do 
		@admin = FactoryGirl.create(:admin)
		@pub = FactoryGirl.create(:publisher, admin_id: FactoryGirl.create(:admin).id)
		@account = @admin.account
	end

	describe "responses" do 
		subject { @account }
		it { should respond_to(:admin_id) }
		it { should respond_to(:plan) }
		it { should respond_to(:trial) }
	  it { should be_valid }
	end
 
	describe "validations" do
		it "should not be valid without an admin_id" do
			@account.admin_id = ""
			@account.should_not be_valid
		end
	end

	describe "associations" do
		it "should respond to user.account" do
			@admin.account.should be_a_kind_of(Account)
			@admin.account.id.should eq @account.id
		end
		it "should have admin_id that matches the user's id" do
			@account.admin_id.should eq @admin.id
		end
	end
end

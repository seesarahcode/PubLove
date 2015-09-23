require 'spec_helper'

describe Account do
	before do 
		@admin = FactoryGirl.create(:admin)
		@pub = FactoryGirl.create(:publisher, admin_id: FactoryGirl.create(:admin).id)
		@account = FactoryGirl.create(:account, admin_id: @admin.id)
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
end

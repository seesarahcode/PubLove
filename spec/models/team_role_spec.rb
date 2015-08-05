require 'spec_helper'

describe TeamRole do
  before do
  	admin = FactoryGirl.create(:admin)
  	book = FactoryGirl.create(:book, publisher_id: admin.publisher_id)
  	@team_role = FactoryGirl.create(:team_role, publisher_id: admin.publisher_id)
  end

  describe "responses" do
		subject { @team_role }
		it { should respond_to(:publisher_id) }
		it { should respond_to(:title) }
	end

  describe "validations" do
  	it "should be valid with valid information" do
			@team_role.should be_valid
		end
		it "should not be valid without a publisher id" do 
			@team_role.publisher_id = ""
			@team_role.should_not be_valid
		end
  end
end

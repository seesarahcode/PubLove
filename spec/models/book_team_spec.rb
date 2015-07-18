require 'spec_helper'

describe BookTeam do
  before do 
  	@pub = FactoryGirl.create(:publisher, admin_id: FactoryGirl.create(:admin).id)
		@book = FactoryGirl.create(:book, :publisher_id => @pub.id)
		@book_team = FactoryGirl.create(:book_team, :book_id => @book.id, :user_id => FactoryGirl.create(:project_manager).id)
	end

	describe "responses" do 
		subject { @book_team }
		it { should respond_to(:book_id) }
		it { should respond_to(:user_id) }
		it { should respond_to(:team_role) }
	  it { should be_valid }
	end

	describe "validations" do
		it "should not be valid without a book id" do
			@book_team.book_id = "" 
			@book_team.should_not be_valid
		end
		it "should not be valid without a user id" do
			@book_team.user_id = ""
			@book_team.should_not be_valid
		end
	end
end

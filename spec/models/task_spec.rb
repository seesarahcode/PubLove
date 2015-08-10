require 'spec_helper'

require 'spec_helper'

describe Task do
	before do
		@admin = FactoryGirl.create(:admin) 
		@user = FactoryGirl.create(:project_manager, 
			:email => "editor@lilpublisher.com", 
			:password => "password", 
			:role => "project_manager", 
			:publisher_id => @admin.publisher_id)
		@cover_artist = FactoryGirl.create(:team_member)
		@task = FactoryGirl.create(:task)
	end

	describe "responses" do
		subject { @task }
		it { should respond_to(:status) }
		it { should respond_to(:title) }
		it { should respond_to(:description) }
		it { should respond_to(:due_date) }
		it { should respond_to(:due_time) }
	end

	describe "validations" do
		it "should be valid with valid information" do
			@task.should be_valid
		end
	end
end
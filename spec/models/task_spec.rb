require 'spec_helper'

describe Task do
	before do
		@admin = FactoryGirl.create(:admin) 
		@user = FactoryGirl.create(:project_manager, 
			:email => "editor@lilpublisher.com", 
			:password => "password", 
			:role => "project_manager", 
			:publisher_id => @admin.publisher_id)
		@book = FactoryGirl.create(:book, publisher_id: @admin.publisher_id)
		@task = FactoryGirl.create(:task, book_id: @book.id,
			assigned_by: @user.id)
	end

	describe "responses" do
		subject { @task }
		it { should respond_to(:status) }
		it { should respond_to(:title) }
		it { should respond_to(:description) }
		it { should respond_to(:due_date) }
		it { should respond_to(:due_time) }
		it { should respond_to(:book_id) }
		it { should respond_to(:assigned_by) }
	end

	describe "validations" do
		it "should be valid with valid information" do
			@task.should be_valid
		end
		it "should not be valid without a book id" do
			@task.book_id = ""
			@task.should_not be_valid
		end
		it "should not be valid without an assigned_by id" do
			@task.assigned_by = ""
			@task.should_not be_valid
		end
	end
end
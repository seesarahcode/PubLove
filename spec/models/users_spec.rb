require 'spec_helper'

describe User do
	before do
		@admin = FactoryGirl.create(:admin) 
		@user = FactoryGirl.create(:project_manager, 
			:email => "editor@lilpublisher.com", 
			:password => "password", 
			:role => "project_manager", 
			:publisher_id => @admin.publisher_id, 
			:first_name => "Marian", 
			:last_name => "Bookley")
		@author = FactoryGirl.create(:author, :publisher_id => @admin.publisher_id)
	end

	describe "responses" do
		subject { @user }
		it { should respond_to(:email) }
		it { should respond_to(:password) }
		it { should respond_to(:role) }
		it { should respond_to(:first_name) }
		it { should respond_to(:last_name) }
		it { should respond_to(:full_name)}
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
		it "should not require a publisher_id for super_admin" do
			FactoryGirl.create(:super_admin).should be_valid
		end
	end

	describe "associations" do
		context "with books" do
			context "and authors" do
				before do
					@book = FactoryGirl.create(:book, publisher_id: @admin.publisher_id)
					@book_author = FactoryGirl.create(:book_author, book_id: @book.id, user_id: @author.id)
				end
				it "should return the author's books" do
					@author.books.include?(@book).should eq true
				end
				it "should find a book_author record with the author's id" do
					ba_record = BookAuthor.where(user_id: @author.id).last
					ba_record.user_id.should eq @author.id
					ba_record.book_id.should eq @book.id
				end
			end
		end
		context "with projects" do
			context "and project managers" do
				before do
					@book = FactoryGirl.create(:book, publisher_id: @admin.publisher_id)
					@pm = FactoryGirl.create(:project_manager, publisher_id: @admin.publisher_id)
					@book_team = FactoryGirl.create(:book_team, book_id: @book.id,
						user_id: @pm.id, team_role: "Project Manager")
				end
				it "should return the pm's book projects" do
					@pm.projects.include?(@book).should eq true
				end
				it "should find a book_team record with the pm's id" do
					bt_record = BookTeam.where(user_id: @pm.id).last
					bt_record.user_id.should eq @pm.id
					bt_record.book_id.should eq @book.id
				end
			end
		end
		context "with events" do
			before do
				@event = FactoryGirl.create(:event)
				@event_attendee = FactoryGirl.create(:event_attendee, user_id: @user.id, event_id: @event.id)
			end
			it "should return the user's events" do
				@user.events.include?(@event).should eq true
			end
			it "should find an event_attendee record with the user's id" do
				e_a = EventAttendee.where(user_id: @user.id).last
				e_a.user_id.should eq @user.id
				e_a.event_id.should eq @event.id
			end
		end
		context "with tasks" do
			before do
				@book = FactoryGirl.create(:book, publisher_id: @admin.publisher_id)
				@cover_artist = FactoryGirl.create(:team_member)
				@task = FactoryGirl.create(:task, book_id: @book.id, assigned_by: @user.id, 
					assigned_to: @cover_artist.id)
			end
			it "should return the assigned user's tasks" do
				@cover_artist.assigned_tasks.include?(@task).should eq true
			end
			it "should return the task owner's tasks" do
				@user.owned_tasks.include?(@task).should eq true
			end
		end
	end

	describe "#create_profile" do
		before do
			@up_count = UserProfile.all.count
		end
		it "should create a UserProfile after creating a user" do 
			FactoryGirl.create(:project_manager)
			UserProfile.all.count.should eq @up_count + 1
		end
		it "should create a UserProfile with right user_id" do
			user = FactoryGirl.create(:project_manager)
			UserProfile.last.user_id.should eq user.id
		end
	end

	describe "#create_account" do
		before do
			@account_count = Account.all.count
		end
		it "should create an Account after creating a user" do
			admin = FactoryGirl.create(:admin)
			Account.all.count.should eq @account_count + 1
		end
		it "should create an Account with the right admin_id" do
			admin = FactoryGirl.create(:admin)
			Account.last.admin_id.should eq admin.id
		end
		it "should not create an account for non-admin users" do
			pm = FactoryGirl.create(:project_manager)
			Account.all.count.should eq @account_count
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

	describe "#not_super?" do
		it "should return false if the user is a super_admin" do
			@super = FactoryGirl.create(:super_admin)
			@super.not_super?.should eq false
		end
		it "should return true if the user is a pm or whatever" do
			@user.not_super?.should eq true
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

	describe "#full_name" do
		it "should insert a space between the first & last name" do
			@user.full_name.should eq "Marian Bookley"
		end
	end
end
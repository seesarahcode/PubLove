require 'spec_helper'

describe "User sign in" do
	context "with valid information" do
		it "allows existing users to sign in with correct info" do
			admin = FactoryGirl.create(:admin)
	    visit new_user_session_path
	    fill_in "Email",                 :with => admin.email
	    fill_in "Password",              :with => admin.password
	    click_button "Log in"
	    page.should have_content("Signed in successfully.")
		end
		it "should send admins to the admin dashboard" do
			admin = FactoryGirl.create(:admin)
			visit new_user_session_path
	    fill_in "Email",                 :with => admin.email
	    fill_in "Password",              :with => admin.password
	    click_button "Log in"
	    page.should have_css('#admin-dash')
		end
		it "should send super_admins to the super_admin dashboard" do
			super_admin = FactoryGirl.create(:super_admin)
			visit new_user_session_path
	    fill_in "Email",                 :with => super_admin.email
	    fill_in "Password",              :with => super_admin.password
	    click_button "Log in"
	    page.should have_css('#super-admin-dash')
		end
		it "should send pms to the project_manager dashboard" do
			pm = FactoryGirl.create(:project_manager)
			visit new_user_session_path
	    fill_in "Email",                 :with => pm.email
	    fill_in "Password",              :with => pm.password
	    click_button "Log in"
	    save_and_open_page
	    page.should have_css('#pm-dash')
		end
		it "should send authors to the author dashboard" do
			author = FactoryGirl.create(:author)
			visit new_user_session_path
	    fill_in "Email",                 :with => author.email
	    fill_in "Password",              :with => author.password
	    click_button "Log in"
	    page.should have_css('#author-dash')
		end
	end
	context "with invalid information" do
		it "should not allow a user to sign in with a bad password" do
			admin = FactoryGirl.create(:admin)
			visit new_user_session_path
	    fill_in "Email",                 :with => admin.email
	    fill_in "Password",              :with => "BookMasterFlex"
	    click_button "Log in"
	    page.should have_content("Invalid email or password.")
		end
		it "should not allow a user to sign in with a bad email" do
			admin = FactoryGirl.create(:admin)
			visit new_user_session_path
	    fill_in "Email",                 :with => "naughtyuser@gmail.com"
	    fill_in "Password",              :with => admin.password
	    click_button "Log in"
	    page.should have_content("Invalid email or password.")
		end
	end
end

describe "User sign out" do
	context "while logged in" do
		it "should destroy the current user's session" do
			pm = FactoryGirl.create(:project_manager)
			visit new_user_session_path
	    fill_in "Email",                 :with => pm.email
	    fill_in "Password",              :with => pm.password
	    click_button "Log in"
			click_link "Log Out"
			page.should have_content("Signed out successfully.")
		end
	end
end
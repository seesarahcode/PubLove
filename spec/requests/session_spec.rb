require 'spec_helper'

describe "User sign in" do
	before :each do
		@user = User.create(email: "random@house.com", password: "b00kworm",
													password_confirmation: "b00kworm", role: "admin")
		visit new_user_session_path
	end
	context "with valid information" do
		it "allows existing users to sign in with correct info" do
	    visit new_user_session_path
	    fill_in "Email",                 :with => @user.email
	    fill_in "Password",              :with => @user.password
	    click_button "Log in"
	    page.should have_content("Signed in successfully.")
		end
	end
	context "with invalid information" do
		it "should not allow a user to sign in with a bad password" do
	    fill_in "Email",                 :with => @user.email
	    fill_in "Password",              :with => "BookMasterFlex"
	    click_button "Log in"
	    page.should have_content("Invalid email or password.")
		end
		it "should not allow a user to sign in with a bad email" do
	    fill_in "Email",                 :with => "naughtyuser@gmail.com"
	    fill_in "Password",              :with => @user.password
	    click_button "Log in"
	    page.should have_content("Invalid email or password.")
		end
	end
end

describe "User sign out" do
	context "while logged in" do
		it "should destroy the current user's session" do
			@user = User.create(email: "random@house.com", password: "b00kworm",
													password_confirmation: "b00kworm", role: "admin")
			login(@user)
			visit root_path
			page.should have_content
			click_link "Log Out"
			page.should have_content("Signed out successfully.")
		end
	end
end
require 'spec_helper'

describe "User sign up" do
	context "with valid information" do
		it "allows users to sign up with an email address and password" do
	    visit new_user_registration_path
	    fill_in "Email",                 :with => "mrsimon@schuster.com"
	    fill_in "Password",              :with => "$uperscript"
	    fill_in "Password confirmation", :with => "$uperscript"
	    click_button "Sign up"
	    page.should have_content("Welcome! You have signed up successfully.")
  	end
	end
	context "with invalid information" do
		it "should not allow users to register without an email address" do
			visit new_user_registration_path
	    fill_in "Email",                 :with => ""
	    fill_in "Password",              :with => "$uperscript"
	    fill_in "Password confirmation", :with => "$uperscript"
	    click_button "Sign up"
	    page.should have_content("1 error")
		end 
		it "should not allow users to register without a password" do
			visit new_user_registration_path
	    fill_in "Email",                 :with => "editor@penguin.com"
	    fill_in "Password",              :with => ""
	    fill_in "Password confirmation", :with => "$uperscript"
	    click_button "Sign up"
	    page.should have_content("2 errors")
		end
		it "should not allow users to register without a password confirmation" do
			visit new_user_registration_path
	    fill_in "Email",                 :with => "mrsimon@schuster.com"
	    fill_in "Password",              :with => "$uperscript"
	    fill_in "Password confirmation", :with => ""
	    click_button "Sign up"
	    page.should have_content("1 error")
		end
		it "should not allow users to register with an existing email address" do 
			FactoryGirl.create(:user, email: "mrsimon@schuster.com", password: "password" )
			visit new_user_registration_path
	    fill_in "Email",                 :with => "mrsimon@schuster.com"
	    fill_in "Password",              :with => "$uperscript"
	    fill_in "Password confirmation", :with => "$uperscript"
	    click_button "Sign up"
	    page.should have_content("1 error")
		end
	end
end

describe "User sign in" do
	before :each do
		@user = User.create(email: "random@house.com", password: "b00kworm",
													password_confirmation: "b00kworm")
		visit new_user_session_path
	end
	context "with valid information" do
		it "allows existing users to sign in with correct info" do
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
			valid_user_is_signed_in
			visit root_path
			page.should have_content
			click_link "Log Out"
			page.should have_content("Signed out successfully.")
		end
	end
end
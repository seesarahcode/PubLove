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
			FactoryGirl.create(:user, email: "mrsimon@schuster.com", password: "password", role: "admin" )
			visit new_user_registration_path
	    fill_in "Email",                 :with => "mrsimon@schuster.com"
	    fill_in "Password",              :with => "$uperscript"
	    fill_in "Password confirmation", :with => "$uperscript"
	    click_button "Sign up"
	    page.should have_content("1 error")
		end
	end
end

describe "User updates account" do
end

describe "User deletes account" do
end
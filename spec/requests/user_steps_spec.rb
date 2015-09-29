require 'spec_helper'

describe "Admin/account sign up" do
	context "with valid information" do
		before do
			visit new_user_registration_path
	    fill_in "Email",                 :with => "mrsimon@schuster.com"
	    fill_in "Password",              :with => "$uperscript"
	    fill_in "Password confirmation", :with => "$uperscript"
	    click_button "Sign up"
	  end
	  it "should send the user to the publisher page" do
	  	pending
	  end
	  it "should allow the user to submit publisher information" do
	  	pending
	  end
	  it "should send the user to the payment page" do
	  	pending
	  end
	end
	context "with invalid information" do
	end
end
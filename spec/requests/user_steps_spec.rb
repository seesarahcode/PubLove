require 'spec_helper'

describe "Admin/account sign up" do
	context "on publisher page" do
		before do
			visit new_user_registration_path
	    fill_in "Email",                 :with => "mrsimon@schuster.com"
	    fill_in "Password",              :with => "$uperscript"
	    fill_in "Password confirmation", :with => "$uperscript"
	    click_button "Sign up"
	  end
	  it "should allow the user to submit publisher information" do
	  	fill_in "Name",			:with => "Simon & Schuster"
	  	fill_in "Phone",		:with => "1-555-888-1010"
	  	fill_in "Website",	:with => "www.simonandschuster.com"
	  	click_button "Continue"
	  end
	end
	context "on payment page" do
		before do
			visit new_user_registration_path
	    fill_in "Email",                 :with => "mrsimon@schuster.com"
	    fill_in "Password",              :with => "$uperscript"
	    fill_in "Password confirmation", :with => "$uperscript"
	    click_button "Sign up"
	    click_button "Continue"
		end
		it "should allow the user to submit a publisher payment" do
			pending
		end
	end
	context "with invalid information" do
	end
end
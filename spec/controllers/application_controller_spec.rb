require 'spec_helper'

describe ApplicationController do 
	describe "after devise sign in" do
		context "as an admin" do 
			before do
				admin = FactoryGirl.create(:admin)
				sign_in(admin)
			end
			it "should respond with success" do
				expect(response.status).to eq 200
			end
			it "should show the admin dashboard"  do
				page.has_css?('#admin-dash')
			end
		end 
		context "as a super_admin" do
			before :each do
				super_admin = FactoryGirl.create(:super_admin)
				sign_in(super_admin)
			end
			it "should respond with success" do
				expect(response.status).to eq 200
			end
			it "should show the superadmin dashboard" do
				page.has_css?('#super-admin-dash')
			end
		end
		context "as a project manager" do
			before do 
				pm = FactoryGirl.create(:project_manager)
				sign_in(pm)
			end
			it "should respond with success" do
				expect(response.status).to eq 200
			end
			it "should show the pm dashboard" do
				page.has_css?('#pm-dash')
			end
		end
		context "as an author" do
			before do 
				author = FactoryGirl.create(:author)
				sign_in(author)
			end
			it "should respond with success" do
				expect(response.status).to eq 200
			end
			it "should show the author dashboard" do
				page.has_css?('#author-dash')
			end
		end
	end
end
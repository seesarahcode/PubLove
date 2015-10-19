require 'spec_helper'

describe HomeController do 
	before do
		admin = FactoryGirl.create(:admin)
		sign_in(admin)
	end
  describe "GET /index" do 
    it "should respond with success" do 
      get :index
      expect(response.status).to eq 200
    end 
  end
end
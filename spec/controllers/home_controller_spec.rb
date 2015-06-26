require 'spec_helper'

describe HomeController do 
  describe "GET /index" do 
    it "should respond with success" do 
      get :index
      expect(response.status).to eq 200
    end 
  end
end
require 'spec_helper'

describe DashboardController do

  describe "GET 'super_admin'" do
    it "returns http success" do
      get 'super_admin'
      response.should be_success
    end
  end

  describe "GET 'admin'" do
    it "returns http success" do
      get 'admin'
      response.should be_success
    end
  end

  describe "GET 'pm'" do
    it "returns http success" do
      get 'pm'
      response.should be_success
    end
  end

  describe "GET 'author'" do
    it "returns http success" do
      get 'author'
      response.should be_success
    end
  end

end

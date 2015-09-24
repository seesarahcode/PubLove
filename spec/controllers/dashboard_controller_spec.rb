require 'spec_helper'

describe DashboardController do

  before(:each) do
    @admin = FactoryGirl.create(:admin)
    @pub = FactoryGirl.create(:publisher, admin_id: @admin.id)
  end

  describe "GET 'super_admin'" do
    before do
      sign_in(FactoryGirl.create(:super_admin, :publisher_id => @pub.id))
    end
    it "returns http success" do
      get 'super_admin'
      response.should be_success
    end
  end

  describe "GET 'admin'" do
    before do 
      sign_in(@admin)
    end
    it "returns http success" do
      get 'admin'
      response.should be_success
    end
  end

  describe "GET 'pm'" do
    before do
      sign_in(FactoryGirl.create(:project_manager, :publisher_id => @pub.id))
    end
    it "returns http success" do
      get 'pm'
      response.should be_success
    end
  end

  describe "GET 'author'" do
    before do
      sign_in(FactoryGirl.create(:author, :publisher_id => @pub.id))
    end
    it "returns http success" do
      get 'author'
      response.should be_success
    end
  end

end

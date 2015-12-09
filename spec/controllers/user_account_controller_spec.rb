require 'spec_helper'

describe UserAccountController do

  before do
    @admin = FactoryGirl.create(:admin)
    @user = FactoryGirl.create(:project_manager, publisher_id: @admin.publisher_id)
    @preferences = @user.preferences
    sign_in(@user)
  end

  describe "GET show" do
    before :each do
      get :show, id: @user.id
    end
    it "should respond with success" do
      expect(response.status).to eq 200
    end
    it "assigns @preferences" do
      assigns(:preferences).should eq(@preferences)
    end
  end

  describe "PUT /update" do
    context "with valid parameters" do
      before :each do
        put :update, id: @user.id, preferences: { theme: "Quoth the Raven" }
      end
      it "should respond with success" do
        expect(response.status).to eq 302
      end
      it "should redirect to the updated user_account page" do
        #response.should redirect_to(@user_profile)
      end
    end
  end

end

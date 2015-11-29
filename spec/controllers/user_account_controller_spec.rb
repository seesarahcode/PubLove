require 'spec_helper'

describe UserAccountController do

  before do
    @admin = FactoryGirl.create(:admin)
    @user = FactoryGirl.create(:project_manager, publisher_id: @admin.publisher_id)
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
      #assigns(:user_profile).should eq(@user_profile)
    end
  end

  describe "PUT /update" do
    context "with valid parameters" do
      before :each do
        #put :update, id: @user_profile.id, user_profile: { bio: "I earned my degree in Awesome Studies from Hogwarts in 2013." }
      end
      it "should respond with success" do
        expect(response.status).to eq 302
      end
      it "should redirect to the updated user_account page" do
        #response.should redirect_to(@user_profile)
      end
      it "should show a flash message" do
        expect(flash[:notice]).to match(/^Your account preferences were successfully updated./)
      end
    end
  end

end

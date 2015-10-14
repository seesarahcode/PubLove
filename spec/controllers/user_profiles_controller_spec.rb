require 'spec_helper'

describe UserProfilesController do

  before do
    @user = FactoryGirl.create(:project_manager)
    @user_profile = FactoryGirl.create(:user_profile, user_id: @user.id)
  end

  describe "GET show" do
    before :each do
      get :show, id: @user_profile.id
    end
    it "should respond with success" do
      expect(response.status).to eq 200
    end
    it "assigns the requested user_profile as @user_profile" do
      assigns(:user_profile).should eq(@user_profile)
    end
  end

  describe "PUT /update" do
    context "with valid parameters" do
      before :each do
        put :update, id: @user_profile.id, user_profile: { bio: "I earned my degree in Awesome Studies from Hogwarts in 2013." }
      end
      it "should respond with success" do
        expect(response.status).to eq 302
      end
      it "should redirect to the updated user_profile page" do
        response.should redirect_to(@user_profile)
      end
      it "should show a flash message" do
        expect(flash[:notice]).to match(/^Your profile was successfully updated./)
      end
    end
  end

end

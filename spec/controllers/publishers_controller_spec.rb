require 'spec_helper'

describe PublishersController do

  before :each do 
    @admin = FactoryGirl.create(:admin)
    @publisher = FactoryGirl.create(:publisher, admin_id: @admin.id)
    sign_in(@admin)
  end

  describe "GET index" do
    before :each do
      get :index
    end
    it "should respond with success" do
      expect(response.status).to eq 200
    end
    it "assigns all publishers as @publishers" do
      @publishers = Publisher.all
      assigns(:publishers).should eq(@publishers)
    end
    it "should only be accessible to a super_admin" do 
      pending
    end
  end

  describe "GET show" do
    before :each do
      get :show, id: @publisher.id
    end
    it "should respond with success" do
      expect(response.status).to eq 200
    end
    it "assigns the requested publisher as @publisher" do
      assigns(:publisher).should eq(@publisher)
    end
  end

  describe "PUT /update" do
    context "with valid parameters" do
      before :each do
        put :update, id: @publisher.id, publisher: { name: "Bigger Book Co." }
      end
      it "should respond with success" do
        expect(response.status).to eq 302
      end
      it "should redirect to the updated publisher page" do
        response.should redirect_to(@publisher)
      end
      it "should show a flash message" do
        expect(flash[:notice]).to match(/^Publisher was successfully updated./)
      end
    end
    context "with invalid parameters" do
      before :each do
        put :update, id: @publisher.id, publisher: { admin_id: nil }
      end
      it "should respond with an error" do
        expect(response.status).to eq 422
      end
      it "should render the edit template" do
        response.should render_template(:edit)
      end
      it "should show a flash message" do
        expect(flash[:notice]).to match(/^Publisher could not be updated./)
      end
      it "should not update the publisher object" do
        @publisher.name.should_not eq ""
      end
    end
  end

  describe "DELETE /destroy" do
    before :each do 
      @pub_count = Publisher.all.count
      get :destroy, id: @publisher.id
    end
    it "should destroy the publisher" do
      Publisher.all.count.should eq (@pub_count - 1)
    end
    it "should redirect to the homepage" do
      expect(response.status).to eq 302
    end
    it "should show a flash message" do 
      expect(flash[:notice]).to match(/^Your publisher account was deleted./)
    end
  end

  describe "GET authors" do
    before :each do
      get :authors
    end
    it "should respond with success" do
      expect(response.status).to eq 200
    end
    it "assigns all of a publisher's authors as @authors" do
      assigns(:authors)
    end
  end


end

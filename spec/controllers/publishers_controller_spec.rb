require 'spec_helper'

describe PublishersController do

  before :each do 
    @publisher = FactoryGirl.create(:publisher)
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

  describe "GET new" do
    before :each do
      get :new
    end
    it "should respond with success" do
      expect(response.status).to eq 200
    end
    it "should assign a new publisher object" do
      assigns(:publisher).should be_a_new(Publisher)
    end
    it "should render the :new template" do
      expect(response).to render_template(:new)
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      before :each do
        @pub_count = Publisher.all.count
        post :create, publisher: { name: "Lil Book Co", street: "123 Read St", 
          city: "Boston", state: "MA", zip: 38930, phone: "290-555-2984", 
          website: "www.lilbook.co" }
      end
      it "should respond with success" do
        expect(response.status).to eq 302
      end
      it "should create a new publisher object" do
        Publisher.all.count.should eq (@pub_count + 1)
      end
      it "should redirect to the new publisher page" do
        response.should redirect_to(Publisher.last)
      end
      it "should show a flash message" do
        expect(flash[:notice]).to match(/^Publisher was successfully created./)
      end
    end
    context "with invalid parameters" do
      before :each do
        @pub_count = Publisher.all.count
        post :create, publisher: { name: "", street: "", city: "Seattle",
          state: "WA", zip: 85920, phone: "", website: "" }
      end
      it "should respond with an error" do
        expect(response.status).to eq 422
      end
      it "should show an error flash message" do
        expect(flash[:notice]).to match(/^Publisher could not be created./)
      end
      it "should not create a new publisher" do
        Publisher.all.count.should eq @pub_count
      end
      it "should render the new page again" do
        response.should render_template(:new)
      end
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
        put :update, id: @publisher.id, publisher: { name: "" }
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


end

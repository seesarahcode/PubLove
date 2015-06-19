require 'spec_helper'

describe BooksController do 
  
  before(:each) do
    request.env["HTTP_ACCEPT"] = 'application/json'
    @book = FactoryGirl.create(:book)
    5.times { FactoryGirl.create(:book) }
  end


    describe "GET /index" do 
      it "should respond with success" do 
        get :index
        expect(response.status).to eq 200
      end 
    end

    describe "POST /create" do
      it "should respond with success" do
        post :create, book: {:title => "Harry Potter and the Chamber of Open Secrets", :isbn => "#{rand(10 ** 13)}"}
        expect(response.status).to eq 201
      end
      it "should redirect to the show page" do 
        response.should redirect_to(@book)
        flash[:notice].should_not be_nil
      end
    end

    describe "GET /show" do 
      it "should respond with success" do
        get :show, id: @book.id
        expect(response.status).to eq 200
      end
    end

    describe "PUT /update" do
      it "should respond with success" do
        get :update, id: @book.id, book: {:title => "Hermione Granger and the Goblet of Awesome"}
        expect(response.status).to eq 200
      end
    end

end

require 'spec_helper'

describe BooksController do 
  
  before(:each) do
    request.env["HTTP_ACCEPT"] = 'application/json'
    @book = FactoryGirl.create(:book)
  end

  context 'when a user loads the books page' do

    describe "GET /index" do 
      it "should return all books" do 
        get :index
        #@body = JSON.parse(response.body)   
        expect(response.status).to eq 200
      end 
    end

    describe "GET /show" do 
      it "should return json data for one book" do
        get :show, id: @book.id
        expect(response.status).to eq 200
      end
    end

    describe "PUT /update" do
      it "should update the record for one book" do
        get :update, id: @book.id
        expect(response.status).to eq 200
      end
    end

  end
end

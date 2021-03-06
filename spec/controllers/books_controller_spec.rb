require 'spec_helper'

describe BooksController do 
  
  before(:each) do
    @admin = FactoryGirl.create(:admin)
    @pub = FactoryGirl.create(:publisher, admin_id: @admin.id)
    sign_in(FactoryGirl.create(:project_manager, :publisher_id => @pub.id))
    @book = FactoryGirl.create(:book, :publisher_id => @pub.id)
    5.times { FactoryGirl.create(:book, :publisher_id => @pub.id) }
  end

    describe "GET /index" do 
      before :each do 
        get :index
      end
      it "should respond with success" do 
        expect(response.status).to eq 200
      end 
      it "should set @books" do
        @books = Book.all
        assigns(:books).should eq(@books)
      end
    end

    describe "GET /new" do
      before :each do
        get :new
      end
      it "should respond with success" do
        expect(response.status).to eq 200
      end
      it "should assign a new book object" do
        assigns(:book).should be_a_new(Book)
      end
      it "should render the :new template" do
        expect(response).to render_template(:new)
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        before :each do 
          @book_count = Book.all.count
          post :create, book: {:title => "Harry Potter and the Chamber of Open Secrets", 
            :isbn => "#{rand(10 ** 13)}", :pub_year => 2015, :publisher => @pub}
        end
        it "should respond with success" do
          expect(response.status).to eq 302
        end
        it "should create a new book object" do
          Book.all.count.should eq (@book_count + 1)
        end
        it "should redirect to the new book page" do
          response.should redirect_to(Book.last)
        end
        it "should show a flash message" do
          expect(flash[:notice]).to match(/^Book was successfully created./)
        end
      end
      context "with invalid parameters" do
        before :each do 
          @book_count = Book.all.count
          post :create, book: { title: "", isbn: nil, pub_year: nil, publisher_id: nil}
        end
        it "should respond with an error" do
          expect(response.status).to eq 422
        end
        it "should show a flash message" do
          expect(flash[:notice]).to match(/^Book could not be created./)
        end
        it "should not create a new book object" do
          Book.all.count.should eq @book_count
        end
        it "should render the new page again" do
          response.should render_template(:new)
        end
      end
    end

    describe "GET /show" do 
      before :each do
        @book = FactoryGirl.create(:book, publisher_id: @pub.id)
        get :show, id: @book.id
      end
      it "should respond with success" do
        expect(response.status).to eq 200
      end
      it "should set a book object" do
        assigns(:book).should eq(@book)
      end
    end

    describe "PUT /update" do
      context "with valid parameters" do
        before :each do
          put :update, id: @book.id, book: {:title => "Hermione Granger and the Goblet of Awesome"}
        end
        it "should respond with success" do
          expect(response.status).to eq 302
        end
        it "should redirect to the updated book page" do
          response.should redirect_to(@book)
        end
        it "should show a flash message" do 
          expect(flash[:notice]).to match(/^Book was successfully updated./)
        end
      end
      context "with invalid parameters" do
        before :each do
          put :update, id: @book.id, book: {:title => "Baby Now We Got Bad Titles", 
          :pub_year => nil }
        end
        it "should respond with an error" do
          expect(response.status).to eq 422
        end
        it "should render the edit template" do
          response.should render_template(:edit)
        end
        it "should render a flash message" do
          expect(flash[:notice]).to match(/^Book could not be updated./)
        end
      end
    end

    describe "DELETE /destroy" do
      before :each do
        @books = Book.all.count
        get :destroy, id: @book.id
      end
      it "should destroy the book object" do
        Book.all.count.should eq (@books-1)
      end
      it "should redirect to the books homepage" do
        expect(response.status).to eq 302
      end
      it "should show a flash message" do
        expect(flash[:notice]).to match(/^Book was successfully destroyed./)
      end
    end

end

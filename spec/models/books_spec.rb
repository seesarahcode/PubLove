require 'spec_helper'

describe Book do 

	before do 
		@pub = FactoryGirl.create(:publisher, admin_id: FactoryGirl.create(:admin).id)
		@book = FactoryGirl.create(:book, :publisher_id => @pub.id)
	end

	describe "responses" do 
		subject { @book }
		it { should respond_to(:title) }
		it { should respond_to(:isbn) }
		it { should respond_to(:sku) }
		it { should respond_to(:pub_year) }
		it { should respond_to(:publisher) }
		it { should respond_to(:authors) }
	  it { should be_valid }
	end

	describe "validations" do
		it "should not be valid without a title" do
			@book.title = ""
			@book.should_not be_valid
		end
		it "should not be valid without a pub year" do
			@book.pub_year = ""
			@book.should_not be_valid
		end
		it "should not be valid without a publisher" do
			@book.publisher = nil
			@book.should_not be_valid
		end
	end

	describe "associations" do
		context "to publisher" do
			it "should have a publisher_id" do
				@book.publisher.should be_a_kind_of(Publisher)
			end
			it "should be included in the results for publisher.books" do
				@pub.books.should_not be_nil
				@pub.books.first.id.should eq @book.id
			end
		end
		context "to authors" do
			before :each do 
				author = FactoryGirl.create(:author)
				@book_author = FactoryGirl.create(:book_author, author_id: author.id, book_id: @book.id)
			end
			
			it "should return authors" do 
				coauthor = FactoryGirl.create(:author)
				author2 = FactoryGirl.create(:book_author, author_id: coauthor.id, book_id: @book.id)
				@book.authors.include?(@book_author1).should eq true
			end
			
			it "should return Book_Author objects" do
				@book.authors.should be_a_kind_of(BookAuthor)
			end
		end
	end

end
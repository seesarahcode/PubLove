require 'spec_helper'

describe BookAuthor do
  before do
  	admin = FactoryGirl.create(:admin)
  	book = FactoryGirl.create(:book, publisher_id: admin.publisher_id)
  	author = FactoryGirl.create(:author)
  	@book_author = FactoryGirl.create(:book_author, book_id: book.id, user_id: author.id)
  end

  describe "responses" do
		subject { @book_author }
		it { should respond_to(:book_id) }
		it { should respond_to(:user_id) }
	end

  describe "validations" do
  	it "should be valid with valid information" do
			@book_author.should be_valid
		end
		it "should not be valid without a user id" do 
			@book_author.user_id = ""
			@book_author.should_not be_valid
		end
		it "should not be valid without a book id" do
			@book_author.book_id = ""
			@book_author.should_not be_valid
		end
  end

end

require 'spec_helper'

describe Book do 

	before do 
		@book = FactoryGirl.create(:book)
	end

	describe "responses" do 
		subject { @book }
		it { should respond_to(:title) }
		it { should respond_to(:isbn) }
		it { should respond_to(:sku) }
		it { should respond_to(:pub_year) }
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
	end

end
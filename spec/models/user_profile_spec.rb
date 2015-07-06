require 'spec_helper'

describe UserProfile do
  before do 
  	@user_profile = FactoryGirl.create(:user_profile)
  end
  describe "responses" do
  	subject { @user_profile }
		it { should respond_to(:user_id) }
		it { should respond_to(:publisher_id) }
		it { should respond_to(:title) }
		it { should respond_to(:start_date) }
		it { should respond_to(:bio) }
		it { should respond_to(:favorite_books) }
		it { should respond_to(:phone) }
  end
end

require 'spec_helper'

describe Imprint do
  before do
  	@pub = FactoryGirl.create(:publisher, :admin_id => FactoryGirl.create(:admin).id)
  	@imprint = FactoryGirl.create(:imprint, :publisher_id => @pub.id)
  end
  describe "responses" do
  	subject { @imprint }
  	it { should respond_to(:name) }
  	it { should respond_to(:publisher_id) }
    it { should be_valid }
  end
  describe "validations" do
  	it "should not be valid without a publisher id" do
  		@imprint.publisher_id = ""
  		@imprint.should_not be_valid
  	end
  end
end

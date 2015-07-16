require 'spec_helper'

describe Notification do
  before do
  	@notification = FactoryGirl.create(:notification)
  end
  describe "responses" do
  	subject { @notification }
  	it { should respond_to(:message) }
  	it { should respond_to(:book_id) }
  	it { should respond_to(:type) }
  	it { should respond_to(:pm_id) }
    it { should be_valid }
  end
  describe "validations" do
  
  end
end

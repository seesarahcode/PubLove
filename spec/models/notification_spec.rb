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
    it "should not be valid without a message" do
      @notification.message = ""
      @notification.should_not be_valid
    end
    it "should not be valid without a type" do
      @notification.type = ""
      @notification.should_not be_valid
    end
  end
end

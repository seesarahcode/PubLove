require 'spec_helper'

describe Event do
  before do 
		@event = FactoryGirl.create(:event)
	end

	describe "responses" do 
		subject { @event }
		it { should respond_to(:event_type) }
		it { should respond_to(:date) }
		it { should respond_to(:time) }
		it { should respond_to(:title) }
		it { should respond_to(:description) }
	  it { should be_valid }
	end

	describe "validations" do
	end
end

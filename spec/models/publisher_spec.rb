require 'spec_helper'

describe Publisher do
	before do
    @admin = FactoryGirl.create(:admin)
		@publisher = FactoryGirl.create(:publisher, admin_id: @admin.id)
	end
  describe "responses" do
  	subject { @publisher }
    it { should respond_to(:admin_id) }
		it { should respond_to(:name) }
		it { should respond_to(:street) }
		it { should respond_to(:city) }
		it { should respond_to(:state) }
		it { should respond_to(:zip) }
		it { should respond_to(:phone) }
		it { should respond_to(:website) }
  end

  describe "validations" do
    it "should not be valid without an admin" do
      @publisher.admin_id = nil
      @publisher.should_not be_valid
    end
  	it "should not be valid without a name" do
  		@publisher.name = ""
  		@publisher.should_not be_valid
  	end
  	it "should not be valid without a street" do
			@publisher.street = ""
  		@publisher.should_not be_valid
  	end
  	it "should not be valid without a city" do
  		@publisher.city = ""
  		@publisher.should_not be_valid
  	end
  	it "should not be valid without a state" do
  		@publisher.state = ""
  		@publisher.should_not be_valid
  	end
  	it "should not be valid without a zip" do
  		@publisher.zip = ""
  		@publisher.should_not be_valid
  	end
  	it "should not be valid without a phone" do
  		@publisher.phone = ""
  		@publisher.should_not be_valid
  	end
  end

  describe "associations" do
    context "to an admin" do
      it "should have an admin with its publisher id" do
        admin = User.find(@publisher.admin_id)
        admin.should be_a_kind_of(User)
        admin.publisher_id.should eq @publisher.id
      end
    end
  end
end

require 'spec_helper'

describe Imprint do
  before do
  	@imprint = FactoryGirl.create(:imprint)
  end
  describe "responses" do
  	subject { @imprint }
  	it { should respond_to(:name) }
  	it { should respond_to(:publisher_id) }
  end
end

require 'spec_helper'

describe "publishers/show" do
  before(:each) do
    @publisher = assign(:publisher, stub_model(Publisher,
      :name => "Name",
      :street => "Street",
      :state => "State",
      :city => "City",
      :zip => 1,
      :phone => "Phone",
      :website => "Website"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Street/)
    rendered.should match(/State/)
    rendered.should match(/City/)
    rendered.should match(/1/)
    rendered.should match(/Phone/)
    rendered.should match(/Website/)
  end
end

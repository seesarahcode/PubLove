require 'spec_helper'

describe "publishers/index" do
  before(:each) do
    assign(:publishers, [
      stub_model(Publisher,
        :name => "Name",
        :street => "Street",
        :state => "State",
        :city => "City",
        :zip => 1,
        :phone => "Phone",
        :website => "Website"
      ),
      stub_model(Publisher,
        :name => "Name",
        :street => "Street",
        :state => "State",
        :city => "City",
        :zip => 1,
        :phone => "Phone",
        :website => "Website"
      )
    ])
  end

  it "renders a list of publishers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
  end
end

require 'spec_helper'

describe "publishers/edit" do
  before(:each) do
    @publisher = assign(:publisher, stub_model(Publisher,
      :name => "MyString",
      :street => "MyString",
      :state => "MyString",
      :city => "MyString",
      :zip => 1,
      :phone => "MyString",
      :website => "MyString"
    ))
  end

  it "renders the edit publisher form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", publisher_path(@publisher), "post" do
      assert_select "input#publisher_name[name=?]", "publisher[name]"
      assert_select "input#publisher_street[name=?]", "publisher[street]"
      assert_select "input#publisher_state[name=?]", "publisher[state]"
      assert_select "input#publisher_city[name=?]", "publisher[city]"
      assert_select "input#publisher_zip[name=?]", "publisher[zip]"
      assert_select "input#publisher_phone[name=?]", "publisher[phone]"
      assert_select "input#publisher_website[name=?]", "publisher[website]"
    end
  end
end

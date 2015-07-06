require 'spec_helper'

describe "user_profiles/index" do
  before(:each) do
    assign(:user_profiles, [
      stub_model(UserProfile,
        :user_id => 1,
        :publisher_id => 2,
        :title => "Title",
        :bio => "MyText",
        :favorite_books => "Favorite Books",
        :phone => "Phone"
      ),
      stub_model(UserProfile,
        :user_id => 1,
        :publisher_id => 2,
        :title => "Title",
        :bio => "MyText",
        :favorite_books => "Favorite Books",
        :phone => "Phone"
      )
    ])
  end

  it "renders a list of user_profiles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Favorite Books".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
  end
end

require 'spec_helper'

describe "user_profiles/show" do
  before(:each) do
    @user_profile = assign(:user_profile, stub_model(UserProfile,
      :user_id => 1,
      :publisher_id => 2,
      :title => "Title",
      :bio => "MyText",
      :favorite_books => "Favorite Books",
      :phone => "Phone"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/Favorite Books/)
    rendered.should match(/Phone/)
  end
end

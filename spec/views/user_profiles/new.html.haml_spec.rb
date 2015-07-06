require 'spec_helper'

describe "user_profiles/new" do
  before(:each) do
    assign(:user_profile, stub_model(UserProfile,
      :user_id => 1,
      :publisher_id => 1,
      :title => "MyString",
      :bio => "MyText",
      :favorite_books => "MyString",
      :phone => "MyString"
    ).as_new_record)
  end

  it "renders new user_profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_profiles_path, "post" do
      assert_select "input#user_profile_user_id[name=?]", "user_profile[user_id]"
      assert_select "input#user_profile_publisher_id[name=?]", "user_profile[publisher_id]"
      assert_select "input#user_profile_title[name=?]", "user_profile[title]"
      assert_select "textarea#user_profile_bio[name=?]", "user_profile[bio]"
      assert_select "input#user_profile_favorite_books[name=?]", "user_profile[favorite_books]"
      assert_select "input#user_profile_phone[name=?]", "user_profile[phone]"
    end
  end
end

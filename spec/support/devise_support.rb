# Helper methods for writing Rspec request tests with Devise
module DeviseRequestHelper
  # Define a method which signs in as a valid user.
  def login(user)
    visit new_user_session_path
    fill_in "Email",       :with => user.email
    fill_in "Password",    :with => user.password
    click_button "Log in"
  end
end

RSpec.configure do |config|
  config.include DeviseRequestHelper, :type => :request
end
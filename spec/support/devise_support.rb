# Helper methods for writing Rspec request tests with Devise
include Devise::TestHelpers

module DeviseRequestHelper
  # Define a method which signs in as a valid user.
  def login(user)
  	@request.env["devise.mapping"] = Devise.mappings[:user]
    visit new_user_session_path
    fill_in "Email",       :with => user.email
    fill_in "Password",    :with => user.password
    click_button "Log in"
  end

  def current_user
  	@user = FactoryGirl.create(:project_manager)
  	@request.env["devise.mapping"] = Devise.mappings[:user]
  	sign_in(@user)
  	current_user = @user
  end
end

RSpec.configure do |config|
  config.include DeviseRequestHelper, :type => :request
  config.include DeviseRequestHelper, :type => :helper
  config.include DeviseRequestHelper, :type => :controller
end
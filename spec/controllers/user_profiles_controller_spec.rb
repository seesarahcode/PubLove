require 'spec_helper'

describe UserProfilesController do

  before do
    @user = FactoryGirl.create(:project_manager)
    @user_profile = FactoryGirl.create(:user_profile, user_id: @user.id)
  end

end

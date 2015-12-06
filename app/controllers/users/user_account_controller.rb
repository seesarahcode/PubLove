class UserAccountController < ApplicationController

	before_action :set_user_and_preferences

  def show
  end

  def edit
  end

  def update
  end

  private

	  def set_user_and_preferences
	  	@user = current_user
	  	@preferences = current_user.preferences
	  end

	  def user_account_params
	    params.require(:user_account).permit(:user_id, :time_zone)
	  end

end
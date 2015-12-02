class UserAccountController < ApplicationController

	before_action :set_user

  def show
  	@preferences = @user.preferences
  end

  def edit
  end

  def update
  end

  private

	  def set_user 
	  	@user = current_user
	  end

	  def user_account_params
	    params.require(:user_account).permit(:user_id, :time_zone)
	  end

end
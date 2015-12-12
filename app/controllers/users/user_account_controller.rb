class UserAccountController < ApplicationController

	before_action :set_user_and_preferences

  def show
  end

  def edit
  end

  def update
  	respond_to do |format|
      if @user.preferences.update_attributes(user_account_params)
        format.html { redirect_to user_account_path(current_user), notice: 'Account was successfully updated.' }
      else
        format.html do
          flash[:notice] = "Account could not be updated."
          render :edit
        end
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  private

	  def set_user_and_preferences
	  	@user = current_user
	  	@preferences = current_user.preferences
	  end

	  def user_account_params
	    params.require(:user_account).permit(:user_id, :time_zone, :theme)
	  end

end
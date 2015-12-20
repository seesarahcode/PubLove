class PreferencesController < ApplicationController
	before_action :set_preferences

  def show
  end

  def edit
  end

  def update
  	respond_to do |format|
      if @preferences.update_attributes(preferences_params)
        format.html { redirect_to preference_path(@preferences), notice: 'Account was successfully updated.' }
      else
        format.html do
          redirect_to edit_preference_path(@preferences)
          flash[:notice] = "Account could not be updated."
        end
        format.json { render json: @preferences.errors, status: :unprocessable_entity }
      end
    end
  end

  private

	  def set_preferences
      @user = current_user
	  	@preferences = @user.preferences
	  end

	  def preferences_params
	    params.permit(:preferences)
	  end
end

class UserStepsController < ApplicationController
	include Wicked::Wizard

	steps :publisher_setup, :payment

	def show
		@user = current_user
		@publisher = @user.publisher
		render_wizard
	end

	def update
    @user = current_user
    @publisher = @user.publisher
    @publisher.update_attributes(pub_params)
    render_wizard @user
  end

  private
  def pub_params
    params.require(:publisher).permit(:id, :admin_id, :name, :street, :city, :state, :zip, :phone, :website)
  end
end

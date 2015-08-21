class DashboardController < ApplicationController
  before_action :find_current_publisher

  def super_admin
  	render :super_admin
  end

  def admin
  	render :admin
  end

  def pm
    @books = @publisher.books
  	render :pm
  end

  def author
  	render :author
  end

  private

  def find_current_publisher
    @publisher = Publisher.find(current_user.publisher_id)
  end
end

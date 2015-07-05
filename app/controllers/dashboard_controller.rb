class DashboardController < ApplicationController
  def super_admin
  	render :super_admin
  end

  def admin
  	render :admin
  end

  def pm
  	render :pm
  end

  def author
  	render :author
  end
end

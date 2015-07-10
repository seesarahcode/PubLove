class PublishersController < ApplicationController
  before_action :set_publisher, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @publishers = Publisher.all
    respond_with(@publishers)
  end

  def show
    respond_with(@publisher)
  end

  def edit
  end

  def update
    respond_to do |format|
      if @publisher.update(publisher_params)
        format.html { redirect_to @publisher, notice: 'Publisher was successfully updated.' }
        format.json { render :show, status: :ok, location: @publisher }
      else
        format.html do
          flash[:notice] = "Publisher could not be updated."
          render :edit, status: :unprocessable_entity 
        end
        format.json { render json: @publisher.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @publisher.destroy
      redirect_to root_path
      flash[:notice] = "Your publisher account was deleted."
    end
  end

  private
    def set_publisher
      @publisher = Publisher.find(params[:id])
    end

    def publisher_params
      params.require(:publisher).permit(:name, :street, :state, :city, :zip, :phone, :website, :admin_id)
    end
end

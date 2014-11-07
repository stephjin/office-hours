class LocationsController < ApplicationController
  def index
    @locations = Location.all
    
  end

  def show
    @location = Location.find(params[:id])
    @review = Review.new
  end

  def new
    @location = Location.new
  end

  def new_review
    @id = params[:location_id]
    @location = Location.find(@id)
    @location.reviews << Review.new(params.require(:review).permit(:title, :body))
    if @location.save
      redirect_to location_path(@id)
    end
  end

  def create
    @location = Location.new(params.require(:location).permit(:name, :address, :description))
    if @location.save
      redirect_to locations_path
    else
      render 'new'
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

end
class LocationsController < ApplicationController
  def index
    @locations = Location.all
    
  end

  def show
    @location = Location.find(params[:id])
    @locations = Location.all
    @review = Review.new
    @nearby = Location.near(@location, 10,  :order => "distance").to_a
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
    @location = Location.new(params.require(:location).permit(:name, :address, :resources, :wifi, :noise, :description))
    if @location.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @location = Location.find(params[:id])

  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(params.require(:location).permit(:name, :address, :resources, :wifi, :noise, :description))
      redirect_to location_path(@location.id)
    else
      render 'edit'
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to root_path
  end

end
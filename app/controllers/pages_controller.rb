class PagesController < ApplicationController

  skip_before_filter :authorize

  def index
    @locations = Location.all
    @location = Location.new
    
  end
  
end

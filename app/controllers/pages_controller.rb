class PagesController < ApplicationController

  skip_before_filter :authorize

  def index
    @locations = Location.all
    @location = Location.new
    @users = User.all
    @user = User.new
  end

  
end

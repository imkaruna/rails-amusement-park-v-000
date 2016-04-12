class RidesController < ApplicationController
  def new
    #raise params.inspect
    @ride = Ride.new
    # @user = User.find(params[:user_id])
    # @attraction = Attraction.find(params[:attraction_id])
    @ride.user = User.find(params[:user_id])
    @ride.attraction = Attraction.find(params[:attraction_id])
    flash[:notice] = @ride.take_ride

    redirect_to user_path(current_user)
  end
end

class RidesController < ApplicationController
  def create
    @ride = Ride.new( ride_params )
    @ride.save
    @ride.take_ride
    redirect_to user_path( session[:user_id] )
  end

  private

  def ride_params
    params.permit( :user_id, :attraction_id )
  end
end

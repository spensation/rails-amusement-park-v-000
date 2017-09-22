class RidesController < ApplicationController
  include ApplicationHelper
  def create
    ride = Ride.new(user_id: params[:user_id], attraction_id: params[:attraction_id])
    if ride.save
      ride = ride.take_ride
      redirect_to user_path(session[:user_id]), notice: ride
    end
  end
end

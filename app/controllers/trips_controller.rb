class TripsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :authenticate_requester!, only: [:edit, :update]

  def index
    @trips = Trip.all

    @joined_trips = current_user&.joined_trips
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = current_user.requested_trips.new(trip_params)

    if @trip.save
      redirect_to trips_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def join
    @trip = Trip.find(params[:id])
    current_user.rides.create(trip: @trip)

    redirect_to trips_path
  end

  def leave
    @trip = Trip.find(params[:id])
    current_user.rides.find_by(trip: @trip).destroy

    redirect_to trips_path
  end

  def accept
    redirect_to root_path unless current_user.driver?

    @trip = Trip.find(params[:id])

    @trip.update(driver: current_user)

    redirect_to trips_path
  end

  def cancel
    @trip = Trip.find(params[:id])
    redirect_to root_path unless current_user == @trip.driver

    @trip.update(driver: nil)

    redirect_to root_path
  end

  def destroy
  end

  private

  def authenticate_requester!
    redirect_to root_url unless current_user == @trip.requester
  end

  def trip_params
    params.require(:trip).permit(:title, :description, :origin, :destination, :capacity, :departing_at)
  end
end

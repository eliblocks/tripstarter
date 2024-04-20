class TripsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :authenticate_requester, except: [:index, :new, :create]

  def index
    @trips = Trip.all
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
  end

  def accept
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

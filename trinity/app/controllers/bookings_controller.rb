class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find params[:id]
  end

  def new
    @booking = Booking.new
    @house = House.find params[:house_id]
  end

  def create
    @booking = Booking.create booking_params
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def update
    @booking = Booking.find params[:id]
    @booking.update booking_params
    @user.save
  end

  def destroy
    @booking = Booking.find params[:id]
    @booking.destroy
    redirect_to booking_path
  end

  private
  def booking_params
    params.require(:guests => params[:guests])
  end
end
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
    @house = ''
    if @booking.save
      request = PostageApp::Request.new(:send_message, {
  'headers'     => { 'from'     => @current_user.email,
                     'subject'  => 'Reservation Request' },
  'recipients'  => 'tmitche831@gmail.com',
  'content'     => {
    'text/plain'  => 'hey tom',
    'text/html'   => reservation_email(@booking, @house, @current_user)
  }
})
response = request.send
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

  def reservation_email(booking, house, user)
    @booking, @house, @user = booking, house, user
    html = File.open("#{Rails.root}/app/views/bookings/reservation_email.html.erb").read
    template = ERB.new(html)
    template.result(binding)
  end

  private
  def booking_params
    params.require(:booking).permit(:guests, :house_id, :date_from, :date_to, :note)
  end
end
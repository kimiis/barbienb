class BookingsController < ApplicationController
  before_action :booking_id, only: %i[show destroy]
  before_action :authenticate_user!

  # get "/"
  def index

  end

  # get "bookings/new"
  def new
    @booking = Booking.new
  end

  # post
  def create
    @booking = Booking.new(bookings_params)
    if @booking.save
      BookingMailer.with(booking: @booking).booking_request.deliver_later
      redirect_to confirmation_booking_path(@booking), notice: 'Booking success, you will received a mail of confirmation.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def cancel
    if @booking.status == 'pending'
      @booking.update(status: 'cancelled')
      redirect_to bookings_path, notice: 'Your reservation has been canceled successfully.'
    else
      redirect_to bookings_path, alert: 'You cannot abord this booking.'
    end
  end


  private

  def bookings_params
    params.require(:booking).permit(:date_debut, :date_end)
  end

  def booking_id
    @booking = Booking.find(params[:id])
  end
end

class BookingsController < ApplicationController
  before_action :booking_id, only: [:show, :cancel]
  before_action :authenticate_user!

  # get "/"
  def index
  end

  # get "bookings/new"
  def new
    @booking = Booking.new
  end

  # post "bookings"
  # pour créer un booking j'ai besoin de price_total, id_house et id_user
  # @booking je récupre house id, arrival date et departure date
  def create
    @house = House.find(params[:house_id])
    @booking = Booking.new(bookings_params)
    # association de house récupéré à au booking nouvellement crée, ça relie le booking a une house spécifique
    @booking.house = @house
    # association d'un userà cette réservation
    @booking.user = current_user
    #association du status du booking
    @booking.status = "Pending host validation"

    # check si date arrivé et départ sont présent si oui, calcule du prix du séjours
    if @booking.arrival_date && @booking.departure_date
      nights = (@booking.departure_date - @booking.arrival_date).to_i
      @booking.price_total = nights * @house.price
    else
      @booking.price_total = 0
    end

    if @booking.save
      # BookingMailer.with(booking: @booking).booking_request.deliver_later
      redirect_to [@house, @booking], notice: 'Booking success, you will received a mail of confirmation.'
    else
      render :show, status: :unprocessable_entity
    end
  end

  # PATCH "bookings/:id/cancel"
  def cancel
    if @booking.status == 'Pending host validation'
      @booking.update(status: 'Canceled')
      redirect_to bookings_path, notice: 'Your reservation has been canceled successfully.'
    else
      redirect_to bookings_path, alert: 'You cannot abord this booking.'
    end
  end


  private

  def bookings_params
    params.require(:booking).permit(:arrival_date, :departure_date, :price_total, :tenant_comment, :owner_comment, :status, :house_id, :user_id)
  end

  def booking_id
    @booking = Booking.find(params[:id])
  end
end

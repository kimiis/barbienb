class BookingsController < ApplicationController
  before_action :booking_id, only: %i[show]
  def index

  end

  def show
    @house = House.find(params[:id])
  end

  def create
  end

  private

  def booking_id
    @booking = Booking.find(params[:id])
  end
end

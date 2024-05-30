class DashboardsController < ApplicationController
  def index
    @bookings = current_user.bookings
    @houses = current_user.houses
  end

  def cancel
    raise
    if @booking.status == 'Pending host validation'
      @booking.update(status: 'Canceled')
      redirect_to bookings_path, notice: 'Your reservation has been canceled successfully.'
    else
      redirect_to bookings_path, alert: 'You cannot abord this booking.'
    end
  end
end

class DashboardsController < ApplicationController
  def index
    @bookings = current_user.bookings
    @houses = current_user.houses
  end
end

class HousesController < ApplicationController
  before_action :set_house, only: [:show]

  # get "houses/:id"
  def show
    @booking = Booking.new
  end

  def index
    @houses = House.all
  end

  private

  def set_house
    @house = House.find(params[:id])
  end

  def house_params
    params.require(:house).permit(:name, :address, :date_debut, :date_end, :description, :price, :category_id, images: [])
  end
end

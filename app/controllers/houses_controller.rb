class HousesController < ApplicationController

  before_action :id_house, only: [:show]
  # get "houses/:id"
  def show
    @booking = Booking.new
  end

  def index
  end

  private

  def id_house
    @house = House.find(params[:id])
  end

  def house_params
    params.require(:house).permit(:name, :address, :description, :price, :category_id, images: [])
  end
end

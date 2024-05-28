class HousesController < ApplicationController

  before_action :id_house, only: [:show]
  # get "houses/"
  def index
  end

  # get "houses/:id"
  def show
    @booking = Booking.new
  end

  # get "houses/new"
  def new
    @house = House.new
    raise
  end

  private

  def id_house
    @house = House.find(params[:id])
  end

  def house_params
    params.require(:house).permit(:name, :address, :date_debut, :date_end, :description, :price, :category_id, images: [])
  end
end

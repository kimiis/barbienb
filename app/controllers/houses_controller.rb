class HousesController < ApplicationController
  before_action :set_house, only: [:show, :destroy]

  # get "houses/"
  def index
    @houses = House.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @houses.geocoded.map do |house|
      {
        lat: house.latitude,
        lng: house.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { house: house }),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def show
    @booking = Booking.new
  end

  # get "houses/new"
  def new
    @house = House.new
    user = User.all.sample
    @house.user = user
  end

  # post "houses/new"
  def create
    @house = House.new(house_params)
    user = User.all.sample
    @house.user = user
    if @house.save
      redirect_to(house_path(@house))
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  # post "houses/:id"
  def destroy
    @house.destroy
    redirect_to(root_path)
  end

  private

  def set_house
    @house = House.find(params[:id])
  end

  def house_params
    params.require(:house).permit(:name, :address, :description, :price, :user_id, :category_id, images: [])
  end
end

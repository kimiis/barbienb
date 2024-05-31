class HousesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_house, only: %i[show destroy edit update]

  # get "houses/"
  def index
    @houses = House.includes(:user).all

    if params[:search].present?
      location = params[:search][:location]
      check_in = params[:search][:check_in]
      check_out = params[:search][:check_out]

      if location.present?
        @houses = @houses.search_by_address_date(location)
      end

      if check_in.present? && check_out.present?
        @houses = @houses.joins(:bookings)
                         .where('bookings.arrival_date <= ? AND bookings.departure_date >= ?', check_out, check_in)
      end
    else
      @houses = House.all
    end

    # The `geocoded` scope filters only flats with coordinates
    @markers = @houses.geocoded.map do |house|
      {
        lat: house.latitude,
        lng: house.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { house: house }),
        marker_html: render_to_string(partial: "marker")
      }
      # raise
    end
  end

  def show
    @booking = Booking.new
  end

  # get "houses/new"
  def new
    @house = House.new
    @house.user = current_user
  end

  # post "houses/new"
  def create
    @house = House.new(house_params)
    @house.user = current_user
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

  def edit
  end

  def update
    if @house.update(house_params)
      redirect_to(house_path(@house))
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  private

  def set_house
    @house = House.find(params[:id])
  end

  def house_params
    params.require(:house).permit(:name, :address, :description, :price,
    :user_id, :category_id, :guest, :bath, :bed, :bedroom, images: [])
  end
end

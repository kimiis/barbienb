class HousesController < ApplicationController
  before_action :set_house, only: %i[show destroy edit update]

  # get "houses/"
  def index
    @houses = House.all
  end

  # get "houses/:id"
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

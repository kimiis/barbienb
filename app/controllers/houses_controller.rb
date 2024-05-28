class HousesController < ApplicationController
  # get "houses/:id"
  def show
    @house = House.find(params[:id])
  end

  def index
  end
end

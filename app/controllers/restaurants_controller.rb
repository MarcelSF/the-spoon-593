class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  # Get the form for the user to fill out
  def new
    @restaurant = Restaurant.new
  end

  # Process and save the information the user is sending to the server
  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to restaurants_path
  end

  def edit
  end

  def update
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    # find the restaurant
    # destroy the restaurant
    @restaurant.destroy
    # redirect to the index
    redirect_to restaurants_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
  # Security measure to filter what information is allowed to come from the form!
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :rating)
  end
end

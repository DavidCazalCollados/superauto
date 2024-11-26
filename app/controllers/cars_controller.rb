class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_car, only: :show

  def index
    @cars = Car.all
  end

  def show
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.save
    redirect_to car_path(@car)
  end

  private

  def car_params
    params.require(:car).permit(:title, :description, :price_per_day)
  end

  def set_car
    @car = Car.find(params[:id])
  end
end

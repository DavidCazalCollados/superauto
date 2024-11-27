class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_car, only: :show

  def index
    @cars = Car.all
  end

  def index
    @cars = if params[:search].present?
      Car.where('title LIKE ? OR description LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%")
    else
      Car.all
    end
  end

  def show
  end

  def new
    @car = Car.new
  end

  def create
    @car = current_user.cars.new(car_params)
    if @car.save
      redirect_to car_path(@car)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def car_params
    params.require(:car).permit(:title, :description, :price_per_day)
  end

  def set_car
    @car = Car.find(params[:id])
  end
end

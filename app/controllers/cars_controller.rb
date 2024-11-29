class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :authorize_owner, only: [:edit, :update, :destroy]

  def index
    if params[:search].present?
      sql_subquery = "title ILIKE :query OR description ILIKE :query"
      @cars = Car.where(sql_subquery, query: "%#{params[:search]}%")
    else
      @cars = Car.all
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @car = Car.new
  end

  def create
    @car = current_user.cars.new(car_params)
    if @car.save
      redirect_to car_path(@car), notice: 'Car was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @car.update(car_params)
      redirect_to car_path(@car)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @car.destroy
    redirect_to dashboard_path, notice: 'Car was successfully deleted.'
  end

  private

  def car_params
    params.require(:car).permit(:title, :description, :price_per_day)
  end

  def set_car
    @car = Car.find(params[:id])
  end

  def authorize_owner
    unless @car.user == current_user
      redirect_to cars_path, alert: 'You are not authorized to perform this action.'
    end
  end
end

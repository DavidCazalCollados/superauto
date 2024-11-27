class BookingsController < ApplicationController
  before_action :set_car, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @booking.user = current_user
    if @booking.save
      redirect_to dashboard_path, notice: "Booking created succesfully"
    else
      render :new, status: :unprocessable_entity, notice: "something went wrong"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_car
    @car = Car.find(params[:car_id])
  end
end

class BookingsController < ApplicationController
  before_action :set_car, only: :create
  before_action :set_booking, only: [:show, :destroy]

  def create
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @booking.user = current_user
    if @booking.save
      redirect_to dashboard_path, notice: "Booking created successfully"
    else
      render "cars/show", status: :unprocessable_entity, notice: "Something went wrong"
    end
  end

  def show
    # This action will handle showing the booking details
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path, notice: 'Booking was successfully deleted.'
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_car
    @car = Car.find(params[:car_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end

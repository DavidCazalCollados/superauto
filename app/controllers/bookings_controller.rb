class BookingsController < ApplicationController
  before_action :set_car, only: :create

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

  def status
    @booking = Booking.find(params[:id])
    @booking.accepted = params[:commit] == "Accept"
    @booking.save
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_car
    @car = Car.find(params[:car_id])
  end
end

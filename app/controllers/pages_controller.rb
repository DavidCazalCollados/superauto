class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @cars = current_user.cars
    @bookings = current_user.bookings
    @car =
  end
end

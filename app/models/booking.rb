class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :user, presence: true
  validates :car, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  # Method to calculate total price based on booking duration and car's price per day
  def total_price
    days = (end_date - start_date).to_i
    days * car.price_per_day
  end
end

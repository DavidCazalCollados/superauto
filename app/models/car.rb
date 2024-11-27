class Car < ApplicationRecord
  has_many :bookings
  belongs_to :user
  validates :user, presence: true
end

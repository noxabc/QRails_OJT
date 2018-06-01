class TripTransaction < ApplicationRecord
  belongs_to :user
  belongs_to :transport_fare

  validates :pickup_location, presence: true
  validates :drop_location, presence: true
  validates :trip_amount, presence: true
end

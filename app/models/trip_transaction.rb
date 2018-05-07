class TripTransaction < ApplicationRecord
  belongs_to :profile

  validates :pickup_location, presence: true
  validates :drop_location, presence: true
  validates :trip_amount, presence: true
end

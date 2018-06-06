class TripTransactionsController < ApplicationController
  layout 'admin'

  def view_trip_transaction
    @trip_transaction = TripTransaction.all
    p @current_user
  end

  private

  def triptransactions_params
    params.permit(:pickup_location, :drop_location, :trip_amount)
  end
end
